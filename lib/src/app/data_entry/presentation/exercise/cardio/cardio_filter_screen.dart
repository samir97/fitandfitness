import 'package:fitandfitness/src/app/data_entry/presentation/exercise/state/exercise_filters.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/template_entry_screen.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardioFilterScreen extends ConsumerStatefulWidget {
  const CardioFilterScreen({
    super.key,
  });

  @override
  ConsumerState<CardioFilterScreen> createState() => _CardioFilterScreenState();
}

class _CardioFilterScreenState extends ConsumerState<CardioFilterScreen> {
  late Set<CardioActivity> cardioActivityFilters;

  @override
  void initState() {
    cardioActivityFilters = ref.read(cardioActivityFilter);

    super.initState();
  }

  void toggleCardioActivity({
    required bool isSelected,
    required CardioActivity cardioActivity,
  }) =>
      setState(
        () => isSelected
            ? cardioActivityFilters = {
                ...cardioActivityFilters,
                cardioActivity,
              }
            : cardioActivityFilters = {
                for (var filter in cardioActivityFilters)
                  if (cardioActivity != filter) filter
              },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateEntryScreen(
        title: "Filter Activities",
        showBackButton: true,
        onSubmit: () {
          ref.read(cardioActivityFilter.notifier).state = cardioActivityFilters;
          Navigator.of(context).pop();
        },
        bodyWidgets: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              "Cardio Activity",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              children: CardioActivity.values
                  .map(
                    (cardioActivity) => FilterChip(
                      selected: cardioActivityFilters.contains(cardioActivity),
                      selectedColor: Colors.yellow.withValues(alpha:0.3),
                      label: Text(cardioActivity.toString()),
                      onSelected: (bool isSelected) => toggleCardioActivity(
                        isSelected: isSelected,
                        cardioActivity: cardioActivity,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
        bottomNavigationBar: SafeArea(
          top: false,
          child: CupertinoButton(
            child: Text(
              "Clear all",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            onPressed: () {
              ref.read(cardioActivityFilter.notifier).state = {};
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
