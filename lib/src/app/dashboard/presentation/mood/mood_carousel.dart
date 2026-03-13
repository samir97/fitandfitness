import 'dart:async';

import 'package:fitandfitness/src/models/mood/mood_sentiment.dart';
import 'package:flutter/material.dart';

class MoodCarousel extends StatefulWidget {
  final Set<MoodSentiment>? moods;

  const MoodCarousel({
    super.key,
    this.moods,
  });

  @override
  State<MoodCarousel> createState() => _MoodCarouselState();
}

class _MoodCarouselState extends State<MoodCarousel> {
  String emoji = '😐';
  String mood = 'None';

  @override
  void initState() {
    super.initState();
    setMood(1);

    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (mounted) setMood(timer.tick + 1);
      },
    );
  }

  void setMood(int tick) {
    final moods = widget.moods?.toList() ?? [];
    if (moods.isNotEmpty) {
      final currentMood = moods[tick % moods.length];
      setState(
        () {
          emoji = currentMood.icon;
          mood = currentMood.toString();
        },
      );
    } else {
      setState(
        () {
          emoji = '😐';
          mood = 'None';
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Column(
        key: ValueKey<String>(mood),
        children: [
          Expanded(
            child: Center(
              child: Text(
                emoji,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Center(
            child: Text(
              mood,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
