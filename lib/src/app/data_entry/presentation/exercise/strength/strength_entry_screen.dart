import 'package:fitandfitness/src/app/data_entry/presentation/delete_entry_button.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/entry_alert_dialog.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_custom_entry_title.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_static_entry_title.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/recorded_at_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/template_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/text_field_tile_with_units.dart';
import 'package:fitandfitness/src/app/data_entry/routing/strength_cardio_entry_route.dart';
import 'package:fitandfitness/src/common_widgets/energy/display/energy_display.dart';
import 'package:fitandfitness/src/common_widgets/picker/enum_picker_list_tile.dart';
import 'package:fitandfitness/src/common_widgets/weight/entry/weight_entry_placeholder_list_tile.dart';
import 'package:fitandfitness/src/data/controllers/exercise/strength_controller.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/models/exercise/strength/experience_level.dart';
import 'package:fitandfitness/src/models/exercise/strength/motion_type.dart';
import 'package:fitandfitness/src/models/exercise/strength/muscle_group.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength_exercise.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StrengthEntryScreen extends ConsumerStatefulWidget {
  const StrengthEntryScreen({
    super.key,
    this.query,
    this.strength,
    this.strengthExercise,
  });

  final String? query;
  final Strength? strength;
  final StrengthExercise? strengthExercise;

  @override
  ConsumerState<StrengthEntryScreen> createState() =>
      _StrengthEntryScreenState();
}

class _StrengthEntryScreenState extends ConsumerState<StrengthEntryScreen> {
  late DateTime _recordedAt;
  double? _weightPerSet;
  MuscleGroup? _muscleGroup;
  MotionType? _motionType;
  ExperienceLevel? _experienceLevel;
  Cardio? _cardio;

  late final TextEditingController _setsTextEditingController;
  late final TextEditingController _repetitionsTextEditingController;
  late final TextEditingController _exerciseNameTextEditingController;

  late final FocusNode _setsFocusNode;
  late final FocusNode _repetitionsFocusNode;
  late final FocusNode _weightFocusNode;
  late final FocusNode _exerciseNameFocusNode;

  @override
  void initState() {
    super.initState();

    _recordedAt = widget.strength?.recordedAt ?? DateTime.now();
    _muscleGroup = widget.strengthExercise?.muscleGroups?.first ??
        widget.strength?.exercise.muscleGroups!.first;
    _motionType = widget.strengthExercise?.motionType ??
        widget.strength?.exercise.motionType;
    _experienceLevel = widget.strengthExercise?.experienceLevel ??
        widget.strength?.exercise.experienceLevel;
    _cardio = widget.strength?.cardio;

    _setsTextEditingController = TextEditingController(
      text: widget.strength?.numberOfSets.toString(),
    );
    _repetitionsTextEditingController = TextEditingController(
      text: widget.strength?.repetitionsPerSet.toString(),
    );
    _exerciseNameTextEditingController = TextEditingController(
      text: widget.strengthExercise?.name ??
          widget.strength?.exercise.name ??
          widget.query,
    );

    _setsFocusNode = FocusNode();
    _repetitionsFocusNode = FocusNode();
    _exerciseNameFocusNode = FocusNode();
    _weightFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    return GestureDetector(
      onTap: () {
        _setsFocusNode.unfocus();
        _repetitionsFocusNode.unfocus();
        _weightFocusNode.unfocus();
      },
      child: CupertinoScaffold(
        body: Builder(
          builder: (cupertinoContext) {
            return TemplateEntryScreen(
              title: (widget.strength == null)
                  ? "Add Strength Exercise"
                  : "Edit Strength Exercise",
              showBackButton: (widget.strength == null),
              onSubmit: () {
                final exerciseName =
                    _exerciseNameTextEditingController.text.trim();
                final numberOfSets =
                    int.tryParse(_setsTextEditingController.text);
                final repetitionsPerSet =
                    int.tryParse(_repetitionsTextEditingController.text);

                String? title;
                String? body;

                if (exerciseName.isEmpty) {
                  title = 'Invalid exercise name';
                  body =
                      'Exercise name cannot be empty, please enter a valid name to save entry.';
                } else if (numberOfSets == null) {
                  title = 'Invalid number of sets';
                  body =
                      'Number of sets cannot be empty, please enter a valid number of sets to save entry.';
                } else if (repetitionsPerSet == null) {
                  title = 'Invalid number of repetitions';
                  body =
                      'Number of repetitions cannot be empty, please enter a valid number of repetitions to save entry.';
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
                } else {
                  ref
                      .read(strengthControllerProvider.notifier)
                      .addOrUpdateEntry(
                        Strength(
                          id: widget.strength?.id,
                          exercise: StrengthExercise(
                            name: exerciseName,
                            isPreset: widget.strength?.exercise.isPreset ??
                                widget.strengthExercise?.isPreset ??
                                false,
                            muscleGroups:
                                (_muscleGroup == null) ? null : [_muscleGroup!],
                            motionType: _motionType,
                            experienceLevel: _experienceLevel,
                          ),
                          numberOfSets: numberOfSets!,
                          repetitionsPerSet: repetitionsPerSet!,
                          weightPerSet: _weightPerSet,
                          cardio: _cardio?.copyWith(
                            recordedAt: _recordedAt,
                            modifiedAt: DateTime.now(),
                          ),
                          recordedAt: _recordedAt,
                          modifiedAt: DateTime.now(),
                        ),
                      );
                  if (widget.strength == null) Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
              bodyWidgets: [
                ((widget.strengthExercise?.isPreset ?? false) ||
                        (widget.strength?.exercise.isPreset ?? false))
                    ? ExerciseStaticEntryTitle(
                        exerciseName: widget.strengthExercise?.name ??
                            widget.strength?.exercise.name ??
                            "",
                        category: widget.strengthExercise?.muscleGroups?.first
                                .toString() ??
                            widget.strength?.exercise.muscleGroups
                                ?.toString() ??
                            "",
                        motionType: widget.strengthExercise?.motionType
                                ?.toString() ??
                            widget.strength?.exercise.motionType?.toString() ??
                            "",
                        experienceLevel: widget
                                .strengthExercise?.experienceLevel
                                ?.toString() ??
                            widget.strength?.exercise.experienceLevel
                                ?.toString() ??
                            "",
                      )
                    : ExerciseCustomEntryTitle(
                        enumPickerTitle: "Muscle Group",
                        initialEnumSelection: _muscleGroup?.toString(),
                        options: MuscleGroup.stringValues,
                        onSelectedEnum: (muscleGroup) => setState(() =>
                            _muscleGroup = MuscleGroup.fromString(muscleGroup)),
                        focusNode: _exerciseNameFocusNode,
                        textEditingController:
                            _exerciseNameTextEditingController,
                        unfocusAllTextFields: _unfocusAllTextFields,
                        autoFocus: widget.strengthExercise == null &&
                            widget.strength?.exercise == null,
                      ),
                const Divider(
                  height: 16,
                ),
                TextFieldTileWithUnits(
                  title: "Number of Sets",
                  isDecimal: false,
                  textEditingController: _setsTextEditingController,
                  focusNode: _setsFocusNode,
                  onTap: _unfocusAllTextFields,
                ),
                const Divider(
                  height: 16,
                ),
                TextFieldTileWithUnits(
                  title: "Repetitions per Set",
                  isDecimal: false,
                  textEditingController: _repetitionsTextEditingController,
                  focusNode: _repetitionsFocusNode,
                  onTap: _unfocusAllTextFields,
                ),
                const Divider(
                  height: 16,
                ),
                userDetailsAndPrefsController.when(
                  data: (userData) {
                    final weightUnit =
                        userData?.unitPreferences.workoutWeight ??
                            WeightUnit.kilograms;
                    return WeightEntryPlaceholderListTile(
                      weight: widget.strength?.weightPerSet,
                      weightUnit: (weightUnit == WeightUnit.stones ||
                              weightUnit == WeightUnit.pounds)
                          ? WeightUnit.pounds
                          : WeightUnit.kilograms,
                      onTap: _weightFocusNode.requestFocus,
                      focusNode: _weightFocusNode,
                      onWeightChanged: (weight) => _weightPerSet = weight,
                    );
                  },
                  error: (_, __) => WeightEntryPlaceholderListTile(
                    weight: widget.strength?.weightPerSet,
                    weightUnit: WeightUnit.kilograms,
                    onTap: _weightFocusNode.requestFocus,
                    focusNode: _weightFocusNode,
                    onWeightChanged: (weight) => _weightPerSet = weight,
                  ),
                  loading: () => WeightEntryPlaceholderListTile(
                    onTap: () {},
                    focusNode: _weightFocusNode,
                    onWeightChanged: (_) => null,
                  ),
                ),
                const Divider(
                  height: 16,
                ),
                if (widget.strengthExercise?.isPreset == false ||
                    widget.strength?.exercise.isPreset == false) ...[
                  EnumPickerListTile(
                    title: "Motion Type",
                    options: MotionType.stringValues,
                    initialSelection: _motionType?.toString(),
                    onSelectedEnum: (motionType) => setState(
                      () => _motionType = MotionType.fromString(motionType),
                    ),
                    onTap: _unfocusAllTextFields,
                  ),
                  const Divider(
                    height: 16,
                  ),
                ],
                if (widget.strengthExercise?.isPreset == false ||
                    widget.strength?.exercise.isPreset == false) ...[
                  EnumPickerListTile(
                    title: "Experience Level",
                    options: ExperienceLevel.stringValues,
                    initialSelection: _experienceLevel?.toString(),
                    onSelectedEnum: (experienceLevel) => setState(
                      () => _experienceLevel =
                          ExperienceLevel.fromString(experienceLevel),
                    ),
                    onTap: _unfocusAllTextFields,
                  ),
                  const Divider(
                    height: 16,
                  ),
                ],
                RecordedAtListTile(
                  onTap: _unfocusAllTextFields,
                  initialDateTime: _recordedAt,
                  onSave: (recordedAt) => setState(
                    () => _recordedAt = recordedAt,
                  ),
                ),
                const Divider(
                  height: 16,
                ),
                ListTile(
                  title: Row(
                    children: [
                      (_cardio == null)
                          ? const Text("Add Calories Burned")
                          : const Text("Calories Burned"),
                      const Spacer(),
                      (_cardio == null)
                          ? const Icon(Icons.local_fire_department_rounded)
                          : EnergyDisplay(_cardio!.caloriesBurned)
                    ],
                  ),
                  onTap: () {
                    _unfocusAllTextFields();
                    showStrengthCardioEntryActionSheets(
                      context: context,
                      cupertinoContext: cupertinoContext,
                      cardioEntryCallback: (cardio) =>
                          setState(() => _cardio = cardio),
                      hasCalories: _cardio != null,
                    );
                  },
                ),
              ],
              bottomNavigationBar: (widget.strength?.id == null)
                  ? null
                  : DeleteEntryButton(
                      onDelete: () => ref
                          .read(strengthControllerProvider.notifier)
                          .deleteEntry(widget.strength!.id!),
                    ),
            );
          },
        ),
      ),
    );
  }

  void _unfocusAllTextFields() {
    _setsFocusNode.unfocus();
    _repetitionsFocusNode.unfocus();
    _weightFocusNode.unfocus();
    _exerciseNameFocusNode.unfocus();
  }

  @override
  void dispose() {
    _setsTextEditingController.dispose();
    _repetitionsTextEditingController.dispose();
    _exerciseNameTextEditingController.dispose();

    _setsFocusNode.dispose();
    _repetitionsFocusNode.dispose();
    _weightFocusNode.dispose();
    _exerciseNameFocusNode.dispose();

    super.dispose();
  }
}
