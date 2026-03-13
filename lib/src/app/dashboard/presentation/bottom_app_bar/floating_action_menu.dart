import 'package:fitandfitness/src/app/dashboard/presentation/bottom_app_bar/fab_menu_five.dart';
import 'package:fitandfitness/src/routing/fab_dialog_route.dart';
import 'package:flutter/material.dart';

class FloatingActionMenu extends StatelessWidget {
  FloatingActionMenu({
    super.key,
  });

  final fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: UniqueKey(),
      shape: const CircleBorder(),
      key: fabKey,
      backgroundColor: const Color(0xFF506478),
      child: Icon(
        Icons.add,
        size: 24,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      onPressed: () {
        RenderBox renderBox =
            fabKey.currentContext!.findRenderObject() as RenderBox;
        Offset fabPosition = renderBox.localToGlobal(Offset.zero);
        Navigator.of(context).push(
          FabDialogRoute(
            builder: (context) {
              return Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (context) {
                      return FabMenuFive(
                        position: fabPosition,
                      );
                    },
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
