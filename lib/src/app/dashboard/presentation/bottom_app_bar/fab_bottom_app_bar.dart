import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    super.key,
    required this.items,
    this.centerItemText = "",
    this.height = 60.0,
    this.iconSize = 24.0,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
  }) {
    assert(items.length == 2 || items.length == 4);
  }

  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color color;
  final Color selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      widget.items.length,
      (int index) {
        return _buildTabItem(
          item: widget.items[index],
          index: index,
          onPressed: _updateIndex,
        );
      },
    );
    items.insert(
      items.length >> 1,
      _MiddleTabItem(
        height: widget.height,
        iconSize: widget.iconSize,
        centerItemText: widget.centerItemText,
        color: widget.color,
      ),
    );

    return BottomAppBar(
      shape: widget.notchedShape,
      notchMargin: 8,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => onPressed(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                item.iconData,
                color: color,
                size: widget.iconSize,
              ),
              Text(
                item.text,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: color,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MiddleTabItem extends StatelessWidget {
  const _MiddleTabItem({
    required this.height,
    required this.iconSize,
    required this.centerItemText,
    required this.color,
  });

  final double height;
  final double iconSize;
  final String centerItemText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AbsorbPointer(
        absorbing: true,
        child: SizedBox(
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: iconSize),
              Text(
                centerItemText,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconData, required this.text});

  IconData iconData;
  String text;
}
