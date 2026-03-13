import 'package:fitandfitness/src/app/data_entry/presentation/delete_entry_button.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/entry_alert_dialog.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/recorded_at_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/template_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/water/water_entry_text_field.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/data/controllers/water_controller.dart';
import 'package:fitandfitness/src/helpers/double_to_string_extension.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:fitandfitness/src/models/water/water.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WaterEntryScreen extends ConsumerStatefulWidget {
  final Water? water;

  const WaterEntryScreen({
    super.key,
    this.water,
  });

  @override
  ConsumerState<WaterEntryScreen> createState() => _WaterEntryScreenState();
}

class _WaterEntryScreenState extends ConsumerState<WaterEntryScreen> {
  WaterUnit _unit = WaterUnit.milliliters;
  late final TextEditingController _textEditingController;
  late final FocusNode _textFieldFocusNode;
  DateTime? _recordedAt;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();
    _textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    return TemplateEntryScreen(
      title: (widget.water == null) ? "Add Water" : "Edit Water",
      crossAxisAlignment: CrossAxisAlignment.center,
      onSubmit: () {
        double? water = double.tryParse(
          _textEditingController.text.trim(),
        );

        if (water == null) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const EntryAlertDialog(
                title: 'Invalid water quantity',
                body:
                    'Water quantity cannot be empty, please enter a valid quantity to save entry.',
              );
            },
          );
        } else {
          final waterController = ref.read(waterControllerProvider.notifier);
          if (_unit == WaterUnit.fluidOunces) {
            water *= 29.57;
          } else if (_unit == WaterUnit.cups) {
            water *= 236.59;
          }

          waterController.addOrUpdateEntry(
            Water(
              id: widget.water?.id,
              quantity: water,
              modifiedAt: DateTime.now(),
              recordedAt:
                  _recordedAt ?? widget.water?.recordedAt ?? DateTime.now(),
            ),
          );

          Navigator.of(context).pop();
        }
      },
      bodyWidgets: [
        const SizedBox(
          height: 8,
        ),
        Icon(
          MdiIcons.cup,
          size: 56,
          color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: userDetailsAndPrefsController.when(
              data: (userData) {
                _unit =
                    userData?.unitPreferences.water ?? WaterUnit.milliliters;
                if (widget.water != null) {
                  double quantity = widget.water!.quantity;
                  if (_unit == WaterUnit.cups) {
                    quantity /= 236.59;
                  } else if (_unit == WaterUnit.fluidOunces) {
                    quantity /= 29.57;
                  }
                  _textEditingController.text = quantity.toShortString();
                }

                return WaterEntryTextField(
                    unit: _unit,
                    textFieldFocusNode: _textFieldFocusNode,
                    textEditingController: _textEditingController);
              },
              error: (_, __) {
                return WaterEntryTextField(
                    unit: WaterUnit.milliliters,
                    textFieldFocusNode: _textFieldFocusNode,
                    textEditingController: _textEditingController);
              },
              loading: () => WaterEntryTextField(
                  textFieldFocusNode: _textFieldFocusNode,
                  textEditingController: _textEditingController)),
        ),
        const Divider(
          height: 16,
        ),
        RecordedAtListTile(
          initialDateTime: widget.water?.recordedAt,
          onSave: (recordedAt) => setState(() => _recordedAt = recordedAt),
        ),
      ],
      bottomNavigationBar: (widget.water?.id == null)
          ? null
          : DeleteEntryButton(
              onDelete: () => ref
                  .read(waterControllerProvider.notifier)
                  .deleteEntry(widget.water!.id!),
            ),
    );
  }
}
