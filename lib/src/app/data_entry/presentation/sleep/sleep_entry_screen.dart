import 'package:fitandfitness/src/app/data_entry/presentation/delete_entry_button.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/entry_alert_dialog.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/notes_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/recorded_at_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_nap_time_picker.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_range_picker.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/template_entry_screen.dart';
import 'package:fitandfitness/src/common_widgets/picker/enum_picker_list_tile.dart';
import 'package:fitandfitness/src/data/controllers/sleep_controller.dart';
import 'package:fitandfitness/src/models/sleep/sleep.dart';
import 'package:fitandfitness/src/models/sleep/sleep_quality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SleepEntryScreen extends ConsumerStatefulWidget {
  final Sleep? sleep;

  const SleepEntryScreen({
    super.key,
    this.sleep,
  });

  @override
  ConsumerState<SleepEntryScreen> createState() => _SleepEntryScreenState();
}

class _SleepEntryScreenState extends ConsumerState<SleepEntryScreen> {
  bool _showSleepSelector = true;
  late DateTime _recordedAt;
  late DateTime _sleepTime;
  late DateTime _wakeUpTime;
  late int _napDuration;
  SleepQuality _sleepQuality = SleepQuality.good;
  String? _notes;

  @override
  void initState() {
    if (widget.sleep != null) {
      final sleepDuration = widget.sleep!.recordedAt.difference(
        widget.sleep!.sleptAt,
      );
      if (sleepDuration.inMinutes <= 55) {
        _showSleepSelector = false;
        _napDuration = sleepDuration.inMinutes - sleepDuration.inMinutes % 5;
      } else {
        _napDuration = 30;
      }
      _recordedAt = widget.sleep!.recordedAt;
      _wakeUpTime = widget.sleep!.recordedAt.subtract(
        Duration(
          minutes: widget.sleep!.recordedAt.minute % 5,
        ),
      );
      _sleepTime = widget.sleep!.sleptAt.subtract(
        Duration(
          minutes: widget.sleep!.sleptAt.minute % 5,
        ),
      );

      _sleepQuality = widget.sleep!.sleepQuality;
      _notes = widget.sleep!.notes;
    } else {
      _recordedAt = DateTime.now();
      _recordedAt = _recordedAt.subtract(
        Duration(minutes: _recordedAt.minute % 5),
      );
      _wakeUpTime = _recordedAt;
      _sleepTime = _recordedAt.subtract(
        const Duration(hours: 8),
      );
      _napDuration = 30;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateEntryScreen(
      title: (widget.sleep == null) ? 'Add Sleep' : 'Edit Sleep',
      onSubmit: () {
        late DateTime sleptAt;
        late DateTime recordedAt;

        recordedAt = _recordedAt.copyWith(
          hour: _wakeUpTime.hour,
          minute: _wakeUpTime.minute,
        );

        if (_showSleepSelector) {
          sleptAt = _recordedAt.copyWith(
            hour: _sleepTime.hour,
            minute: _sleepTime.minute,
          );

          if (_sleepTime.hour > _wakeUpTime.hour) {
            sleptAt = sleptAt.subtract(
              const Duration(
                days: 1,
              ),
            );
          }
        } else {
          sleptAt = recordedAt.subtract(
            Duration(
              minutes: _napDuration,
            ),
          );
        }

        final sleepLength = recordedAt.difference(sleptAt).inMinutes;

        if (sleepLength > 1200) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const EntryAlertDialog(
                title: 'Invalid sleep interval',
                body: 'Sleeping for over 20 hours in not supported.',
              );
            },
          );
        } else if (sleepLength < 5) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const EntryAlertDialog(
                title: 'Invalid sleep interval',
                body: 'Sleeping for less than 5 minutes in not supported.',
              );
            },
          );
        } else {
          ref.read(sleepControllerProvider.notifier).addOrUpdateEntry(
                Sleep(
                  id: widget.sleep?.id,
                  sleptAt: sleptAt,
                  recordedAt: recordedAt,
                  sleepQuality: _sleepQuality,
                  notes: _notes,
                  modifiedAt: DateTime.now(),
                ),
              );

          Navigator.of(context).pop();
        }
      },
      bodyWidgets: [
        Center(
          child: CupertinoSlidingSegmentedControl<bool>(
            backgroundColor: CupertinoColors.systemGrey2,
            thumbColor: Colors.purple,
            groupValue: _showSleepSelector,
            onValueChanged: (bool? showSleepSelector) async {
              if (showSleepSelector != null) {
                setState(
                  () => _showSleepSelector = showSleepSelector,
                );
              }
            },
            children: const <bool, Widget>{
              true: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Sleep',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
              false: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Nap',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
            },
          ),
        ),
        const SizedBox(height: 16),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: _showSleepSelector
              ? SizedBox(
                  key: const Key("Sleep"),
                  child: SleepRangePicker(
                    initialSleepTime: _sleepTime,
                    initialWakeUpTime: _wakeUpTime,
                    onSleepTimeChanged: (sleepTime) =>
                        setState(() => _sleepTime = sleepTime),
                    onWakeUpTimeChanged: (wakeUpTime) =>
                        setState(() => _wakeUpTime = wakeUpTime),
                  ),
                )
              : SizedBox(
                  key: const Key("Nap"),
                  child: SleepNapTimePicker(
                    initialWakeUpTime: _wakeUpTime,
                    initialNapDuration: _napDuration,
                    onNapDurationChanged: (napDuration) =>
                        setState(() => _napDuration = napDuration),
                    onWakeUpTimeChanged: (wakeUpTime) =>
                        setState(() => _wakeUpTime = wakeUpTime),
                  ),
                ),
        ),
        EnumPickerListTile(
          title: "Sleep Quality",
          initialSelection: _sleepQuality.toString(),
          onSelectedEnum: (sleepQuality) => setState(
            () => _sleepQuality = SleepQuality.values.firstWhere(
              (element) => element.toString() == sleepQuality,
            ),
          ),
          options: SleepQuality.stringValues.reversed.toList(),
          onTap: () {},
          hasPlaceholder: false,
        ),
        const Divider(
          height: 16,
        ),
        RecordedAtListTile(
          title: "Wake Up Date",
          dateOnly: true,
          initialDateTime: _recordedAt,
          onSave: (recordedAt) => setState(() => _recordedAt = recordedAt),
        ),
        const Divider(
          height: 16,
        ),
        NotesListTile(
          title: "Journal",
          body: _notes,
          onSave: (text) => setState(() => _notes = text),
        ),
      ],
      bottomNavigationBar: (widget.sleep?.id == null)
          ? null
          : DeleteEntryButton(
              onDelete: () => ref
                  .read(sleepControllerProvider.notifier)
                  .deleteEntry(widget.sleep!.id!),
            ),
    );
  }
}
