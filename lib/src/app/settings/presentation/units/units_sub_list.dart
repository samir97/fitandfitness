import 'package:fitandfitness/src/common_widgets/sticky_sub_list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class UnitsSubList extends StatelessWidget {
  const UnitsSubList({
    super.key,
    required this.title,
    required this.units,
    this.addDivider = true,
  });

  final String title;
  final List<Widget> units;
  final bool addDivider;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: StickySubListHeader(
        title: title,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => Column(
            children: [
              units[i],
              if (i == units.length - 1 && addDivider)
                const Divider(
                  height: 0,
                ),
            ],
          ),
          childCount: units.length,
        ),
      ),
    );
  }
}
