import 'dart:math';

import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/mood/mood_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/water/water_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/weight/weight_entry_screen.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:fitandfitness/src/routing/exercise_entry_route.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FabMenuFive extends StatefulWidget {
  final Offset position;

  const FabMenuFive({super.key, required this.position});

  @override
  State<FabMenuFive> createState() => _FabMenuFiveState();
}

class _FabMenuFiveState extends State<FabMenuFive>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  bool switchWidget = true;

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
    const radius = -200;
    final centerAdjust = sqrt(3 / 4);

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
                  pi / 3,
                  radius / 2 * animation.value,
                ),
                child: MenuItem(
                  color: Colors.blue,
                  label: 'Water',
                  icon: MdiIcons.cup,
                  opacity: animation.value,
                  onPressed: () {
                    controller.reverse();
                    _navigateToPage(
                      context,
                      const WaterEntryScreen(),
                    );
                  },
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  pi * 2 / 3,
                  radius / 2 * animation.value,
                ),
                child: MenuItem(
                  color: Colors.grey,
                  label: 'Weight',
                  icon: MdiIcons.scaleBathroom,
                  opacity: animation.value,
                  onPressed: () {
                    controller.reverse();
                    _navigateToPage(
                      context,
                      const WeightEntryScreen(),
                    );
                  },
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  pi * 1 / 3,
                  radius * animation.value,
                ),
                child: MenuItem(
                  color: Colors.yellow.shade900,
                  label: 'Exercise',
                  icon: MdiIcons.dumbbell,
                  opacity: animation.value,
                  onPressed: () {
                    controller.reverse();
                    Navigator.pop(context);
                    showExerciseActionSheets(
                      context,
                      navigateToCardio: (BuildContext context) {
                        controller.reverse();
                        _navigateToPage(
                          context,
                          CupertinoScaffold(
                            body: Builder(
                              builder: (cupertinoContext) {
                                return ExerciseEntryScreen(
                                  cupertinoContext: cupertinoContext,
                                  exerciseType: ExerciseType.cardio,
                                );
                              },
                            ),
                          ),
                        );
                      },
                      navigateToStrength: (BuildContext context) {
                        controller.reverse();
                        _navigateToPage(
                          context,
                          CupertinoScaffold(
                            body: Builder(
                              builder: (cupertinoContext) {
                                return ExerciseEntryScreen(
                                  cupertinoContext: cupertinoContext,
                                  exerciseType: ExerciseType.strength,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  pi / 2,
                  radius * centerAdjust * animation.value,
                ),
                child: MenuItem(
                  color: Colors.red.shade400,
                  label: 'Mood',
                  icon: MdiIcons.emoticonOutline,
                  opacity: animation.value,
                  onPressed: () {
                    controller.reverse();
                    _navigateToPage(
                      context,
                      const MoodEntryScreen(),
                    );
                  },
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.translate(
                offset: Offset.fromDirection(
                  pi * 2 / 3,
                  radius * animation.value,
                ),
                child: MenuItem(
                  color: Colors.purple,
                  label: 'Sleep',
                  icon: Icons.bedtime,
                  opacity: animation.value,
                  onPressed: () {
                    controller.reverse();
                    _navigateToPage(
                      context,
                      const SleepEntryScreen(),
                      // const SleepEntryScreen(),
                    );
                  },
                ),
              ),
            ),
            Transform.translate(
              offset: widget.position,
              child: Transform.rotate(
                angle: pi / 4 * animation.value,
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  heroTag: UniqueKey(),
                  backgroundColor: const Color(0xFF506478),
                  onPressed: () {
                    controller.reverse();
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _navigateToPage(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
      context,
      _createRoute(page),
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animationc, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(
            curve: curve,
          ),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
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
          shape: const CircleBorder(),
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
