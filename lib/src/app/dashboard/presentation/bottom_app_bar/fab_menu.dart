import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FabMenu extends StatefulWidget {
  final Offset position;

  const FabMenu({super.key, required this.position});

  @override
  State<FabMenu> createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutQuint,
      ),
    )..addListener(
        () {
          setState(
            () {},
          );
        },
      );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const radius = -155;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) controller.reverse();
      },
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  pi / 12 * animation.value,
                  0.7 * radius * animation.value,
                ),
                child: MenuItem(
                  color: Colors.red.shade400,
                  label: 'Mood',
                  icon: MdiIcons.emoticonOutline,
                  opacity: animation.value,
                  onPressed: () {},
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  7 * pi / 24 * animation.value,
                  1.1 * radius * animation.value,
                ),
                child: MenuItem(
                  color: Colors.green,
                  label: 'Food',
                  icon: MdiIcons.silverwareForkKnife,
                  opacity: animation.value,
                  onPressed: () {},
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  pi / 2,
                  1.2 * radius * animation.value,
                ),
                child: MenuItem(
                  color: Colors.grey,
                  label: 'Weight',
                  icon: MdiIcons.scaleBathroom,
                  opacity: animation.value,
                  onPressed: () {},
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  pi - (7 * pi / 24) * animation.value,
                  1.1 * radius * animation.value,
                ),
                child: MenuItem(
                  color: Colors.yellow.shade900,
                  label: 'Exercise',
                  icon: MdiIcons.dumbbell,
                  opacity: animation.value,
                  onPressed: () {},
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  pi - (pi / 12) * animation.value,
                  0.7 * radius * animation.value,
                ),
                child: MenuItem(
                  color: Colors.purple,
                  label: 'Sleep',
                  icon: Icons.bedtime,
                  opacity: animation.value,
                  onPressed: () {},
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  pi / 2,
                  1.2 * radius / 2 * animation.value,
                ),
                child: MenuItem(
                  color: Colors.blue,
                  label: 'Drink',
                  icon: MdiIcons.cup,
                  opacity: animation.value,
                  onPressed: () {},
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.rotate(
                angle: pi / 4 * animation.value,
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF506478),
                  onPressed: () {
                    controller.reverse();
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final double opacity;

  const MenuItem({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    double correctedOpacity = opacity;
    if (opacity > 1) correctedOpacity = 1;
    if (opacity < 0) correctedOpacity = 0;

    return Column(
      children: [
        FloatingActionButton(
          elevation: 0,
          heroTag: label,
          backgroundColor: Colors.white,
          onPressed: onPressed,
          child: Icon(
            icon,
            color: color,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Opacity(
          opacity: correctedOpacity,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        )
      ],
    );
  }
}
