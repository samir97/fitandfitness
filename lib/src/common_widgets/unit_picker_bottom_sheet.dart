import 'package:fitandfitness/src/common_widgets/bottom_sheet_title_bar.dart';
import 'package:flutter/cupertino.dart';

const double _kItemExtent = 32.0;
const double _kPickerWidth = 320.0;
const double _kMagnification = 2.35 / 2.1;
const double _kSqueeze = 1.25;
const double _kPickerHeight = 216.0;
const double _kMaximumOffAxisFraction = 0.45;

class UnitPickerBottomSheet extends StatefulWidget {
  final String title;
  final int? initialLeftValue;
  final int? initialRightValue;
  final UnitConfig leftUnit;
  final UnitConfig rightUnit;
  final Function(int leftValue, int rightValue) onSave;

  const UnitPickerBottomSheet._({
    super.key,
    required this.title,
    this.initialLeftValue,
    this.initialRightValue,
    required this.leftUnit,
    required this.rightUnit,
    required this.onSave,
  });

  factory UnitPickerBottomSheet.feetInches({
    Key? key,
    final int? initialLeftValue,
    final int? initialRightValue,
    required Function(int feet, int inches) onSave,
  }) {
    return UnitPickerBottomSheet._(
      key: key,
      title: 'Height',
      initialLeftValue: initialLeftValue,
      initialRightValue: initialRightValue,
      leftUnit: UnitConfig(
        range: 9,
        display: (index) => "${index + 1}'",
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 12.0),
      ),
      rightUnit: UnitConfig(
        range: 12,
        display: (index) => '$index"',
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 12.0),
      ),
      onSave: onSave,
    );
  }

  factory UnitPickerBottomSheet.stonePounds({
    Key? key,
    final int? initialLeftValue,
    final int? initialRightValue,
    required Function(int feet, int inches) onSave,
  }) {
    return UnitPickerBottomSheet._(
      key: key,
      title: 'Weight',
      initialLeftValue: initialLeftValue,
      initialRightValue: initialRightValue,
      leftUnit: UnitConfig(
        range: 100,
        display: (index) => "${index + 1} st",
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 12.0),
      ),
      rightUnit: UnitConfig(
        range: 14,
        display: (index) => '$index lb',
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 12.0),
      ),
      onSave: onSave,
    );
  }

  @override
  State<UnitPickerBottomSheet> createState() => _UnitPickerBottomSheetState();
}

class _UnitPickerBottomSheetState extends State<UnitPickerBottomSheet> {
  late int leftValue;
  late int rightValue;
  late FixedExtentScrollController leftController;
  late FixedExtentScrollController rightController;

  @override
  initState() {
    super.initState();
    leftValue = widget.initialLeftValue ?? 1;
    rightValue = widget.initialRightValue ?? 0;
    leftController = FixedExtentScrollController(initialItem: leftValue - 1);
    rightController = FixedExtentScrollController(initialItem: rightValue);
  }

  List<Widget> _generateItems(UnitConfig config) =>
      List.generate(config.range, (index) {
        return _AlignedItem(
          text: config.display(index),
          alignment: config.alignment,
          padding: config.padding,
        );
      });

  @override
  Widget build(BuildContext context) {
    const Widget startSelectionOverlay =
        CupertinoPickerDefaultSelectionOverlay(capEndEdge: false);
    const Widget endSelectionOverlay =
        CupertinoPickerDefaultSelectionOverlay(capStartEdge: false);

    return Column(
      children: [
        BottomSheetTitleBar(
          title: widget.title,
          onSave: () => widget.onSave(leftValue, rightValue),
        ),
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(
                width: _kPickerWidth, height: _kPickerHeight),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: _CustomCupertinoPicker(
                    scrollController: leftController,
                    items: _generateItems(widget.leftUnit),
                    onChanged: (value) => leftValue = value + 1,
                    offAxisFraction: -_kMaximumOffAxisFraction,
                    selectionOverlay: startSelectionOverlay,
                  ),
                ),
                Expanded(
                  child: _CustomCupertinoPicker(
                    scrollController: rightController,
                    items: _generateItems(widget.rightUnit),
                    onChanged: (value) => rightValue = value,
                    offAxisFraction: _kMaximumOffAxisFraction,
                    selectionOverlay: endSelectionOverlay,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AlignedItem extends StatelessWidget {
  final String text;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;

  const _AlignedItem({
    required this.text,
    required this.alignment,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(alignment: alignment, child: Text(text)),
    );
  }
}

class _CustomCupertinoPicker extends StatelessWidget {
  final FixedExtentScrollController scrollController;
  final List<Widget> items;
  final Function(int) onChanged;
  final double offAxisFraction;
  final Widget selectionOverlay;

  const _CustomCupertinoPicker({
    required this.scrollController,
    required this.items,
    required this.onChanged,
    required this.offAxisFraction,
    required this.selectionOverlay,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      scrollController: scrollController,
      itemExtent: _kItemExtent,
      magnification: _kMagnification,
      squeeze: _kSqueeze,
      offAxisFraction: offAxisFraction,
      selectionOverlay: selectionOverlay,
      onSelectedItemChanged: onChanged,
      children: items,
    );
  }
}

class UnitConfig {
  final int range;
  final String Function(int index) display;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;

  UnitConfig({
    required this.range,
    required this.display,
    required this.alignment,
    required this.padding,
  });
}
