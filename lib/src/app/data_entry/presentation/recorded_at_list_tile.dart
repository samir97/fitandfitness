import 'package:fitandfitness/src/common_widgets/date_time_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordedAtListTile extends StatefulWidget {
  const RecordedAtListTile({
    super.key,
    this.title = "Recorded At",
    this.color,
    this.initialDateTime,
    this.dateOnly = false,
    this.onTap,
    required this.onSave,
  });

  final String title;
  final Color? color;
  final DateTime? initialDateTime;
  final bool dateOnly;
  final VoidCallback? onTap;
  final Function(DateTime) onSave;

  @override
  State<RecordedAtListTile> createState() => _RecordedAtListTileState();
}

class _RecordedAtListTileState extends State<RecordedAtListTile> {
  late DateTime _selectedDateTime;
  late DateFormat _dateFormatter;

  @override
  void initState() {
    if (widget.dateOnly) {
      _dateFormatter = DateFormat('dd MMM yyyy');
    } else {
      _dateFormatter = DateFormat('dd MMM yyyy HH:mm');
    }

    _selectedDateTime = widget.initialDateTime ?? DateTime.now();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title),
          Text(
            _dateFormatter.format(_selectedDateTime),
          )
        ],
      ),
      onTap: () {
        widget.onTap?.call();
        showModalBottomSheet(
          context: context,
          builder: (context) => DateTimePickerBottomSheet(
            title: widget.title,
            dateOnly: widget.dateOnly,
            initialDateTime: _selectedDateTime,
            onSave: (dateTime) => setState(
              () {
                _selectedDateTime = dateTime;
                widget.onSave(dateTime);
              },
            ),
          ),
        );
      },
    );
  }
}
