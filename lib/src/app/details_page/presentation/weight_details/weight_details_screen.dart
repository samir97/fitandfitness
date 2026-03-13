import 'package:fitandfitness/src/app/data_entry/presentation/weight/weight_entry_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_error_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_shimmer_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_template_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/weight_details/weight_details_body.dart';
import 'package:fitandfitness/src/data/controllers/weight_controller.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

enum WeightProperties { weight, bodyFat, muscleMass }

class WeightDetailsScreen extends ConsumerWidget {
  const WeightDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weightController = ref.watch(weightControllerProvider);

    return DetailsTemplateScreen(
      builder: (cupertinoContext) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Weight'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  CupertinoScaffold.showCupertinoModalBottomSheet(
                    expand: true,
                    context: cupertinoContext,
                    builder: (context) => const WeightEntryScreen(),
                  );
                },
                tooltip: 'Add',
              )
            ],
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: weightController.when(
              data: (weightEntries) => WeightDetailsBody(
                cupertinoContext: cupertinoContext,
                weightEntries: weightEntries,
              ),
              loading: () => const DetailsShimmerScreen(),
              error: (e, st) => const DetailsErrorScreen(
                entryType: EntryType.weight,
              ),
            ),
          ),
        );
      },
    );
  }
}
