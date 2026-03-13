import 'package:fitandfitness/src/models/exercise/cardio/cardio_activity.dart';
import 'package:fitandfitness/src/models/exercise/strength/experience_level.dart';
import 'package:fitandfitness/src/models/exercise/strength/motion_type.dart';
import 'package:fitandfitness/src/models/exercise/strength/muscle_group.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseSearch = StateProvider.autoDispose<String>(
  (_) => "",
);

final cardioActivityFilter = StateProvider.autoDispose<Set<CardioActivity>>(
  (_) => const {},
);

final experienceLevelFilter = StateProvider.autoDispose<Set<ExperienceLevel>>(
  (_) => const {},
);

final muscleGroupFilter = StateProvider.autoDispose<Set<MuscleGroup>>(
  (_) => const {},
);

final motionTypeFilter = StateProvider.autoDispose<Set<MotionType>>(
  (_) => const {},
);
