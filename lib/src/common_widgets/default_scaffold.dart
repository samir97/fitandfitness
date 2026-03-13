import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final List<Widget> bodyWidgets;
  final double? cacheExtent;
  final Widget? navigationBar;

  const DefaultScaffold({
    super.key,
    this.bodyWidgets = const [],
    this.cacheExtent,
    this.navigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        cacheExtent: cacheExtent,
        slivers: <Widget>[
          (navigationBar == null)
              ? SliverToBoxAdapter(
                  child: Container(),
                )
              : navigationBar!,
          SliverList(
            delegate: SliverChildListDelegate(bodyWidgets),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: bottomPadding + 8.0,
            ),
          ),
        ],
      ),
    );
  }
}
