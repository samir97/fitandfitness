import 'dart:io';

import 'package:fitandfitness/src/app/data_entry/presentation/delete_entry_button.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/entry_alert_dialog.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/icon_to_text_field_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/notes_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/photo_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/recorded_at_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/template_entry_screen.dart';
import 'package:fitandfitness/src/common_widgets/weight/entry/weight_entry_list_tile.dart';
import 'package:fitandfitness/src/data/controllers/weight_controller.dart';
import 'package:fitandfitness/src/models/weight/weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WeightEntryScreen extends ConsumerStatefulWidget {
  const WeightEntryScreen({
    super.key,
    this.weight,
    this.isLastEntry = false,
  });

  final Weight? weight;
  final bool isLastEntry;

  @override
  ConsumerState<WeightEntryScreen> createState() => _WeightEntryScreenState();
}

class _WeightEntryScreenState extends ConsumerState<WeightEntryScreen> {
  double? _weight;
  late final TextEditingController _bodyFatTextEditingController;
  late final TextEditingController _muscleMassTextEditingController;

  late final FocusNode _weightFocusNode;
  late final FocusNode _bodyFatFocusNode;
  late final FocusNode _muscleMassFocusNode;

  late DateTime _recordedAt;
  bool _hideBodyFatPlaceholder = false;
  bool _hideMuscleMassPlaceholder = false;
  bool _deleteRecordedPhoto = false;
  XFile? _photo;
  String? _notes;

  @override
  void initState() {
    super.initState();

    _weight = widget.weight?.weight;
    _recordedAt = widget.weight?.recordedAt ?? DateTime.now();

    _bodyFatTextEditingController =
        TextEditingController(text: widget.weight?.bodyFat?.toString());
    _muscleMassTextEditingController =
        TextEditingController(text: widget.weight?.muscleMass?.toString());

    _notes = widget.weight?.notes;

    _weightFocusNode = FocusNode();
    _bodyFatFocusNode = FocusNode()
      ..addListener(
        () => setState(
          () => _hideBodyFatPlaceholder = _bodyFatFocusNode.hasFocus,
        ),
      );
    _muscleMassFocusNode = FocusNode()
      ..addListener(
        () => setState(
          () => _hideMuscleMassPlaceholder = _muscleMassFocusNode.hasFocus,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusAllTextFields,
      child: TemplateEntryScreen(
        title: (widget.weight == null) ? "Add Weight" : "Edit Weight",
        onSubmit: () {
          if (_weight == null) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => const EntryAlertDialog(
                title: 'Invalid weight',
                body:
                    'Weight cannot be empty, please enter a valid weight to save entry.',
              ),
            );
            return;
          }

          final weightController = ref.read(weightControllerProvider.notifier);

          if (_photo != null) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => AlertDialog(
                title: const Text("Saving Photo..."),
                content: AspectRatio(
                  aspectRatio: 1.5,
                  child: !Platform.isIOS
                      ? const CupertinoActivityIndicator()
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            );
          }

          weightController
              .addOrUpdateEntry(
            Weight(
              id: widget.weight?.id,
              weight: _weight!,
              bodyFat: double.tryParse(_bodyFatTextEditingController.text),
              muscleMass:
                  double.tryParse(_muscleMassTextEditingController.text),
              notes: _notes,
              modifiedAt: DateTime.now(),
              recordedAt: _recordedAt,
            ),
            photo: _photo,
            deleteRecordedPhoto: _deleteRecordedPhoto,
          )
              .then(
            (_) {
              if (_photo != null && context.mounted) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }
            },
          ).onError(
            (_, __) {
              if (_photo != null && context.mounted) {
                Navigator.of(context).pop();
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => const AlertDialog(
                    title: Text("Error"),
                    content: Text(
                      "An error occurred while saving the photo, please try again.",
                    ),
                  ),
                );
              }
            },
          );

          if (_photo == null) Navigator.of(context).pop();
        },
        bodyWidgets: [
          WeightEntryListTile(
            onTap: _unfocusAllTextFields,
            focusNode: _weightFocusNode,
            onWeightChanged: (value) => _weight = value,
            weight: _weight,
          ),
          const Divider(
            height: 16,
          ),
          RecordedAtListTile(
            onTap: _unfocusAllTextFields,
            initialDateTime: _recordedAt,
            onSave: (recordedAt) => setState(() => _recordedAt = recordedAt),
          ),
          const Divider(
            height: 16,
          ),
          IconToTextFieldTile(
            title: (_hideBodyFatPlaceholder ||
                    _bodyFatTextEditingController.text.isNotEmpty)
                ? "Body Fat"
                : "Body Fat %",
            placeholder: MdiIcons.cheese,
            hidePlaceholder: (_hideBodyFatPlaceholder ||
                _bodyFatTextEditingController.text.isNotEmpty),
            textEditingController: _bodyFatTextEditingController,
            focusNode: _bodyFatFocusNode,
            onTap: () => setState(
              () {
                _hideBodyFatPlaceholder = true;
                _bodyFatFocusNode.requestFocus();
              },
            ),
          ),
          const Divider(
            height: 16,
          ),
          IconToTextFieldTile(
            title: (_hideMuscleMassPlaceholder ||
                    _muscleMassTextEditingController.text.isNotEmpty)
                ? "Muscle Mass"
                : "Muscle Mass %",
            placeholder: MdiIcons.armFlex,
            hidePlaceholder: (_hideMuscleMassPlaceholder ||
                _muscleMassTextEditingController.text.isNotEmpty),
            textEditingController: _muscleMassTextEditingController,
            focusNode: _muscleMassFocusNode,
            onTap: () => setState(
              () {
                _hideMuscleMassPlaceholder = true;
                _muscleMassFocusNode.requestFocus();
              },
            ),
          ),
          const Divider(
            height: 16,
          ),
          PhotoListTile(
            title: "Progress Photo",
            onTap: _unfocusAllTextFields,
            recordedImage: widget.weight?.progressPhotos?.firstOrNull?.url,
            onPhotoPicked: (photo) {
              _photo = null;
              _deleteRecordedPhoto = true;
              _photo = photo;
            },
            onPhotoDelete: () {
              _photo = null;
              _deleteRecordedPhoto = true;
            },
          ),
          const Divider(
            height: 16,
          ),
          NotesListTile(
            title: "Notes",
            body: _notes,
            onTap: _unfocusAllTextFields,
            onSave: (notes) => setState(
              () => _notes = notes,
            ),
          ),
        ],
        bottomNavigationBar: (widget.weight?.id == null)
            ? null
            : DeleteEntryButton(
                onDelete: () => ref
                    .read(weightControllerProvider.notifier)
                    .deleteEntry(context, widget.weight!),
                shouldNavigateBack: !widget.isLastEntry,
              ),
      ),
    );
  }

  void _unfocusAllTextFields() {
    _weightFocusNode.unfocus();
    _bodyFatFocusNode.unfocus();
    _muscleMassFocusNode.unfocus();
  }

  @override
  void dispose() {
    _bodyFatTextEditingController.dispose();
    _muscleMassTextEditingController.dispose();

    _weightFocusNode.dispose();
    _bodyFatFocusNode.dispose();
    _muscleMassFocusNode.dispose();

    super.dispose();
  }
}
