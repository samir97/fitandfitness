import 'package:fitandfitness/src/app/data_entry/presentation/water/water_entry_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_error_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_template_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/water_details/water_details_body.dart';
import 'package:fitandfitness/src/data/controllers/water_controller.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../details_shimmer_screen.dart';

class WaterDetailsScreen extends ConsumerWidget {
  const WaterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waterController = ref.watch(waterControllerProvider);

    return DetailsTemplateScreen(
      builder: (cupertinoContext) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Water'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    CupertinoScaffold.showCupertinoModalBottomSheet(
                  expand: true,
                  context: cupertinoContext,
                  builder: (context) => const WaterEntryScreen(),
                ),
                tooltip: 'Add',
              )
            ],
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: waterController.when(
              data: (waterEntries) => WaterDetailsBody(
                cupertinoContext: cupertinoContext,
                waterEntries: waterEntries,
              ),
              loading: () => const DetailsShimmerScreen(),
              error: (e, st) => const DetailsErrorScreen(
                entryType: EntryType.water,
              ),
            ),
          ),
        );
      },
    );
  }
}
