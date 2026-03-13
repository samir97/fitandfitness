import 'package:fitandfitness/src/app/data_entry/presentation/delete_entry_button.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/entry_alert_dialog.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_custom_entry_title.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_static_entry_title.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/recorded_at_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/shimmer_text_field_tile_with_units.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/template_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/text_field_tile_with_units.dart';
import 'package:fitandfitness/src/data/controllers/exercise/cardio_controller.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/data/controllers/weight_controller.dart';
import 'package:fitandfitness/src/helpers/double_to_string_extension.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_activity.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:fitandfitness/src/models/user/user_details_and_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardioEntryScreen extends ConsumerStatefulWidget {
  const CardioEntryScreen({
    super.key,
    this.query,
    this.cardioExercise,
    this.cardio,
    this.cardioEntryCallback,
  });

  final String? query;
  final CardioExercise? cardioExercise;
  final Cardio? cardio;
  final Function(Cardio cardio)? cardioEntryCallback;

  @override
  ConsumerState<CardioEntryScreen> createState() => _CardioEntryScreenState();
}

class _CardioEntryScreenState extends ConsumerState<CardioEntryScreen> {
  late final TextEditingController _minutedPerformedTextEditingController;
  late final TextEditingController _caloriesBurnedTextEditingController;
  late final TextEditingController _exerciseNameTextEditingController;

  late final FocusNode _minutedPerformedFocusNode;
  late final FocusNode _caloriesBurnedFocusNode;
  late final FocusNode _exerciseNameFocusNode;

  EnergyUnit _energyUnit = EnergyUnit.kilojoules;
  double? _weight;
  CardioActivity? _cardioActivity;
  DateTime? _recordedAt;

  @override
  void initState() {
    super.initState();

    _cardioActivity = widget.cardioExercise?.cardioActivity ??
        widget.cardio?.exercise.cardioActivity;

    _recordedAt = widget.cardio?.recordedAt ?? DateTime.now();

    _exerciseNameTextEditingController = TextEditingController(
      text: widget.cardioExercise?.name ??
          widget.cardio?.exercise.name ??
          widget.query,
    );

    _caloriesBurnedTextEditingController = TextEditingController();

    _minutedPerformedTextEditingController = TextEditingController(
      text: widget.cardio?.minutesPerformed.toString(),
    )..addListener(
        () {
          final met = widget.cardioExercise?.met ?? widget.cardio?.exercise.met;

          final minutesPerformed =
              double.tryParse(_minutedPerformedTextEditingController.text);

          if (minutesPerformed == null) {
            _caloriesBurnedTextEditingController.text = "";
          }

          if (_weight != null && minutesPerformed != null && met != null) {
            double calories = (_weight! * (minutesPerformed / 60) * met);
            if (_energyUnit == EnergyUnit.kilojoules) calories *= 4.18;

            _caloriesBurnedTextEditingController.text =
                calories.toShortString();
          }
        },
      );

    _minutedPerformedFocusNode = FocusNode();
    _caloriesBurnedFocusNode = FocusNode();
    _exerciseNameFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(weightControllerProvider).when(
        data: (weightEntries) {
          if (weightEntries.isNotEmpty) {
            _weight = weightEntries.first.weight;
          }
        },
        loading: () => _weight = null,
        error: (_, __) => _weight = null);

    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    return GestureDetector(
      onTap: _unfocusAllTextFields,
      child: TemplateEntryScreen(
        title: (widget.cardio == null)
            ? "Add Cardio Exercise"
            : "Edit Cardio Exercise",
        showBackButton: (widget.cardio == null),
        onSubmit: () {
          final caloriesBurned =
              double.tryParse(_caloriesBurnedTextEditingController.text.trim());
          final minutesPerformed =
              int.tryParse(_minutedPerformedTextEditingController.text.trim());

          String? title;
          String? body;

          if (widget.cardioExercise == null &&
              _exerciseNameTextEditingController.text.trim().isEmpty) {
            title = 'Invalid exercise name';
            body =
                'Exercise name cannot be empty, please enter a valid name to save entry.';
          } else if (minutesPerformed == null) {
            title = 'Invalid minutes performed';
            body =
                'Minutes performed cannot be empty, please enter a valid number of minutes performed to save entry.';
          } else if (caloriesBurned == null) {
            title = 'Invalid calories burned';
            body =
                'Calories burned cannot be empty, please enter a valid amount of calories burned to save entry.';
          }

          if (title != null && body != null) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return EntryAlertDialog(
                  title: title!,
                  body: body!,
                );
              },
            );
          } else if (caloriesBurned != null && minutesPerformed != null) {
            final cardio = Cardio(
              id: widget.cardio?.id,
              exercise: CardioExercise(
                name: _exerciseNameTextEditingController.text.trim(),
                cardioActivity: _cardioActivity,
                met: widget.cardio?.exercise.met ?? widget.cardioExercise?.met,
                isPreset: widget.cardio?.exercise.isPreset ??
                    widget.cardioExercise?.isPreset ??
                    false,
                recordedAt: _recordedAt ?? DateTime.now(),
              ),
              caloriesBurned: (_energyUnit == EnergyUnit.kilojoules)
                  ? caloriesBurned
                  : caloriesBurned * 4.18,
              minutesPerformed: minutesPerformed,
              recordedAt: _recordedAt ?? DateTime.now(),
              modifiedAt: DateTime.now(),
            );

            if (widget.cardioEntryCallback != null) {
              widget.cardioEntryCallback?.call(cardio);
            } else {
              ref
                  .read(cardioControllerProvider.notifier)
                  .addOrUpdateEntry(cardio);

              Navigator.pop(context);
            }

            if (widget.cardio == null) Navigator.pop(context);
          }
        },
        bodyWidgets: [
          ((widget.cardioExercise?.isPreset ?? false) ||
                  (widget.cardio?.exercise.isPreset ?? false))
              ? ExerciseStaticEntryTitle(
                  exerciseName: widget.cardioExercise?.name ??
                      widget.cardio?.exercise.name ??
                      "",
                  category: widget.cardioExercise?.cardioActivity?.toString() ??
                      widget.cardio?.exercise.cardioActivity?.toString() ??
                      "",
                )
              : ExerciseCustomEntryTitle(
                  enumPickerTitle: "Cardio Activity",
                  initialEnumSelection: _cardioActivity?.toString(),
                  options: CardioActivity.stringValues,
                  onSelectedEnum: (selectedEnum) =>
                      _cardioActivity = CardioActivity.fromString(selectedEnum),
                  focusNode: _exerciseNameFocusNode,
                  textEditingController: _exerciseNameTextEditingController,
                  unfocusAllTextFields: _unfocusAllTextFields,
                  autoFocus: widget.cardioExercise == null &&
                      widget.cardio?.exercise == null,
                ),
          const Divider(
            height: 16,
          ),
          TextFieldTileWithUnits(
            title: "Minutes Performed",
            units: "mins",
            textEditingController: _minutedPerformedTextEditingController,
            focusNode: _minutedPerformedFocusNode,
            isDecimal: false,
            onTap: _unfocusAllTextFields,
          ),
          const Divider(
            height: 16,
          ),
          userDetailsAndPrefsController.when(
            data: (UserDetailsAndPrefs? userData) {
              _energyUnit =
                  userData?.unitPreferences.energy ?? EnergyUnit.kilojoules;

              final caloriesBurned = widget.cardio?.caloriesBurned;

              if (caloriesBurned != null) {
                if (_energyUnit == EnergyUnit.kilojoules) {
                  _caloriesBurnedTextEditingController.text =
                      caloriesBurned.toShortString();
                } else {
                  _caloriesBurnedTextEditingController.text =
                      (caloriesBurned / 4.18).toShortString();
                }
              }

              return TextFieldTileWithUnits(
                title: "Calories Burned",
                units: (_energyUnit == EnergyUnit.kilojoules) ? "kJ" : "cal",
                textEditingController: _caloriesBurnedTextEditingController,
                focusNode: _caloriesBurnedFocusNode,
                onTap: _unfocusAllTextFields,
              );
            },
            error: (_, __) {
              final caloriesBurned = widget.cardio?.caloriesBurned;

              if (caloriesBurned != null) {
                _caloriesBurnedTextEditingController.text =
                    caloriesBurned.toShortString();
              }

              return TextFieldTileWithUnits(
                title: "Calories Burned",
                units: "kJ",
                textEditingController: _caloriesBurnedTextEditingController,
                focusNode: _caloriesBurnedFocusNode,
                onTap: _unfocusAllTextFields,
              );
            },
            loading: () => const ShimmerTextFieldTileWithUnits(),
          ),
          if (widget.cardioEntryCallback == null) ...[
            const Divider(
              height: 16,
            ),
            RecordedAtListTile(
              onTap: _unfocusAllTextFields,
              initialDateTime: _recordedAt,
              onSave: (recordedAt) => setState(
                () => _recordedAt = recordedAt,
              ),
            ),
          ],
        ],
        bottomNavigationBar: (widget.cardio?.id == null)
            ? null
            : DeleteEntryButton(
                onDelete: () => ref
                    .read(cardioControllerProvider.notifier)
                    .deleteEntry(widget.cardio!.id!),
              ),
      ),
    );
  }

  void _unfocusAllTextFields() {
    _minutedPerformedFocusNode.unfocus();
    _caloriesBurnedFocusNode.unfocus();
    _exerciseNameFocusNode.unfocus();
  }

  @override
  void dispose() {
    _minutedPerformedTextEditingController.dispose();
    _caloriesBurnedTextEditingController.dispose();
    _exerciseNameTextEditingController.dispose();

    _minutedPerformedFocusNode.dispose();
    _caloriesBurnedFocusNode.dispose();
    _exerciseNameFocusNode.dispose();

    super.dispose();
  }
}
