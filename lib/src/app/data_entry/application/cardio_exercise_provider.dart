import 'package:fitandfitness/src/models/exercise/cardio/cardio_activity.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bicyclingCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where((exercise) => exercise.cardioActivity == CardioActivity.bicycling)
      .toList(),
);

final conditioningCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) =>
            exercise.cardioActivity == CardioActivity.conditioningExercise,
      )
      .toList(),
);

final dancingCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) => exercise.cardioActivity == CardioActivity.dancing,
      )
      .toList(),
);

final fishingCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) => exercise.cardioActivity == CardioActivity.fishing,
      )
      .toList(),
);

final gardeningCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) => exercise.cardioActivity == CardioActivity.gardening,
      )
      .toList(),
);

final musicPlayingCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) => exercise.cardioActivity == CardioActivity.musicPlaying,
      )
      .toList(),
);

final occupationCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) => exercise.cardioActivity == CardioActivity.occupation,
      )
      .toList(),
);

final runningCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) => exercise.cardioActivity == CardioActivity.running,
      )
      .toList(),
);

final sportsPlayingCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) => exercise.cardioActivity == CardioActivity.sports,
      )
      .toList(),
);

final walkingCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) => exercise.cardioActivity == CardioActivity.walking,
      )
      .toList(),
);

final waterActivitiesCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) => exercise.cardioActivity == CardioActivity.waterActivities,
      )
      .toList(),
);

final winterActivitiesCardioExerciseProvider = Provider(
  (ref) => ref
      .read(cardioExerciseProvider)
      .where(
        (exercise) =>
            exercise.cardioActivity == CardioActivity.winterActivities,
      )
      .toList(),
);

final cardioExerciseProvider = Provider(
  (ref) => const [
    CardioExercise(
      name:
          "Bicycling, <10 mph (<16.09 km/h), leisure, to work or for pleasure",
      cardioActivity: CardioActivity.bicycling,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, >20 mph (>32.19 km/h), racing, not drafting",
      cardioActivity: CardioActivity.bicycling,
      met: 15.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Bicycling, 10-11.9 mph (16.09-19.15 km/h), leisure, slow, light effort",
      cardioActivity: CardioActivity.bicycling,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Bicycling, 12 mph (19.31 km/h), seated, hands on brake hoods or bar drops, 80 rpm",
      cardioActivity: CardioActivity.bicycling,
      met: 8.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Bicycling, 12 mph (19.31 km/h), standing, hands on brake hoods, 60 rpm",
      cardioActivity: CardioActivity.bicycling,
      met: 9,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Bicycling, 12-13.9 mph (19.31-22.37 km/h), leisure, moderate effort",
      cardioActivity: CardioActivity.bicycling,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Bicycling, 14-15.9 mph (22.53-25.59 km/h), racing or leisure, fast, vigorous effort",
      cardioActivity: CardioActivity.bicycling,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Bicycling, 16-19 mph (25.75-30.58 km/h), racing/not drafting or > 19 mph drafting, very fast, racing general",
      cardioActivity: CardioActivity.bicycling,
      met: 12,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, bmx",
      cardioActivity: CardioActivity.bicycling,
      met: 8.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, general",
      cardioActivity: CardioActivity.bicycling,
      met: 7.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, leisure, 5.5 mph (9 km/h)",
      cardioActivity: CardioActivity.bicycling,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, leisure, 9.4 mph (15 km/h)",
      cardioActivity: CardioActivity.bicycling,
      met: 5.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, mountain, competitive, racing",
      cardioActivity: CardioActivity.bicycling,
      met: 16,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, mountain, general",
      cardioActivity: CardioActivity.bicycling,
      met: 8.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, mountain, uphill, vigorous",
      cardioActivity: CardioActivity.bicycling,
      met: 14,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, on dirt or farm road, moderate pace",
      cardioActivity: CardioActivity.bicycling,
      met: 5.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, to/from work, self selected pace",
      cardioActivity: CardioActivity.bicycling,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Unicycling",
      cardioActivity: CardioActivity.bicycling,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Activity promoting video game (e.g., wii fit), light effort (e.g., balance, yoga)",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 2.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Activity promoting video game (e.g., wii fit), moderate effort (e.g., aerobic, resistance)",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Activity promoting video/arcade game (e.g., exergaming, dance dance revolution), vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 7.2,
      isPreset: true,
    ),
    CardioExercise(
      name: "Army type obstacle course exercise, boot camp training program",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, stationary, 101-160 watts, vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 8.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, stationary, 161-200 watts, vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 11,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, stationary, 201-270 watts, very vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 14,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, stationary, 30-50 watts, very light to light effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, stationary, 51-89 watts, light-to-moderate effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 4.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, stationary, 90-100 watts, moderate to vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, stationary, general",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bicycling, stationary, rpm/spin bike class",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 8.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Calisthenics (e.g., push ups, sit ups, pull-ups, jumping jacks), vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Calisthenics (e.g., push ups, sit ups, pull-ups, lunges), moderate effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Calisthenics (e.g., situps, abdominal crunches), light effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 2.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Calisthenics, light or moderate effort, general (e.g., back exercises), going up & down from floor ( 150)",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Circuit training, including kettlebells, some aerobic movement with minimal rest, general, vigorous intensity",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Circuit training, moderate effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 4.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Curvestm exercise routines in women",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Elliptical trainer, moderate effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Health club exercise classes, general, gym/weight training combined in one visit",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Health club exercise, conditioning classes",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 7.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Health club exercise, general",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Home exercise, general",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Native new zealander physical activities (e.g., haka powhiri, moteatea, waita tira, whakawatea, etc.), general, moderate effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Native new zealander physical activities (e.g., haka, taiahab), general, vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Pilates, general",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Resistance (weight) training, multiple exercises, 8-15 repetitions at varied resistance",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Resistance (weight) training, squats , slow or explosive effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Resistance training (weight lifting, free weight, nautilus or universal), power lifting or body building, vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rope skipping, general",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 12.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rowing, stationary ergometer, general, vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rowing, stationary, 100 watts, moderate effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rowing, stationary, 150 watts, vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 8.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rowing, stationary, 200 watts, very vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 12,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rowing, stationary, general, moderate effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 4.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Ski machine, general",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Slide board exercise, general",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 11,
      isPreset: true,
    ),
    CardioExercise(
      name: "Slimnastics, jazzercise",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Stair-treadmill ergometer, general",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 9,
      isPreset: true,
    ),
    CardioExercise(
      name: "Stretching, mild",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 2.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Teaching exercise class (e.g., aerobic, water)",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Therapeutic exercise ball, fitball exercise",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 2.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Upper body exercise, arm ergometer",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 2.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Upper body exercise, stationary bicycle – airdyne (arms only) 40 rpm, moderate",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 4.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Video exercise workouts, tv conditioning programs (e.g., cardio-resistance), moderate effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Video exercise workouts, tv conditioning programs (e.g., cardio-resistance), vigorous effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Video exercise workouts, tv conditioning programs (e.g., yoga, stretching), light effort",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 2.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Water aerobics, water calisthenics, water exercise",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Whirlpool, sitting",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 1.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Yoga, hatha",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Yoga, nadisodhana",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 2,
      isPreset: true,
    ),
    CardioExercise(
      name: "Yoga, power",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Yoga, surya namaskar",
      cardioActivity: CardioActivity.conditioningExercise,
      met: 3.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Aerobic dance wearing approximately 10-15 lbs (4.54 to 6.80 kg) weights",
      cardioActivity: CardioActivity.dancing,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Aerobic, general",
      cardioActivity: CardioActivity.dancing,
      met: 7.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Aerobic, high impact",
      cardioActivity: CardioActivity.dancing,
      met: 7.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Aerobic, low impact",
      cardioActivity: CardioActivity.dancing,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Aerobic, step, with 10 – 12 inch step",
      cardioActivity: CardioActivity.dancing,
      met: 9.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Aerobic, step, with 4-inch step",
      cardioActivity: CardioActivity.dancing,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Aerobic, step, with 6 – 8 inch step",
      cardioActivity: CardioActivity.dancing,
      met: 7.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Anishinaabe jingle dancing",
      cardioActivity: CardioActivity.dancing,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Ballet, modern, or jazz, general, rehearsal or class",
      cardioActivity: CardioActivity.dancing,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Ballet, modern, or jazz, performance, vigorous effort",
      cardioActivity: CardioActivity.dancing,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Ballroom dancing, competitive, general",
      cardioActivity: CardioActivity.dancing,
      met: 11.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Ballroom, fast",
      cardioActivity: CardioActivity.dancing,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Ballroom, slow (e.g., waltz, foxtrot, slow dancing, samba, tango, 19th century dance, mambo, cha cha)",
      cardioActivity: CardioActivity.dancing,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bench step class, general",
      cardioActivity: CardioActivity.dancing,
      met: 8.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Caribbean dance (abakua, beguine, bellair, bongo, brukin’s, caribbean quadrills, dinki mini, gere, gumbay, ibo, jonkonnu, kumina, oreisha, jambu)",
      cardioActivity: CardioActivity.dancing,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Ethnic or cultural dancing (e.g., greek, middle eastern, hula, salsa, merengue, bamba y plena, flamenco, belly, and swing)",
      cardioActivity: CardioActivity.dancing,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "General dancing (e.g., disco, folk, irish step dancing, line dancing, polka, contra, country)",
      cardioActivity: CardioActivity.dancing,
      met: 7.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Tap",
      cardioActivity: CardioActivity.dancing,
      met: 4.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing from boat or canoe, sitting",
      cardioActivity: CardioActivity.fishing,
      met: 2,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing from river bank and walking",
      cardioActivity: CardioActivity.fishing,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing from river bank, standing",
      cardioActivity: CardioActivity.fishing,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing in stream, in waders",
      cardioActivity: CardioActivity.fishing,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing related, digging worms, with shovel",
      cardioActivity: CardioActivity.fishing,
      met: 4.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing with a spear, standing",
      cardioActivity: CardioActivity.fishing,
      met: 2.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing, catching fish with hands",
      cardioActivity: CardioActivity.fishing,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing, crab fishing",
      cardioActivity: CardioActivity.fishing,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing, dip net, setting net and retrieving fish, general",
      cardioActivity: CardioActivity.fishing,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing, fishing wheel, setting net and retrieving fish, general",
      cardioActivity: CardioActivity.fishing,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing, general",
      cardioActivity: CardioActivity.fishing,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing, ice, sitting",
      cardioActivity: CardioActivity.fishing,
      met: 2,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing, jog or line, standing, general",
      cardioActivity: CardioActivity.fishing,
      met: 1.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fishing, set net, setting net and retrieving fish, general",
      cardioActivity: CardioActivity.fishing,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Gardening, general, moderate effort",
      cardioActivity: CardioActivity.gardening,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Mowing lawn, general",
      cardioActivity: CardioActivity.gardening,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Mowing lawn, power mower, light or moderate effort",
      cardioActivity: CardioActivity.gardening,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Mowing lawn, riding mower",
      cardioActivity: CardioActivity.gardening,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Mowing lawn, walk, hand mower",
      cardioActivity: CardioActivity.gardening,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Mowing lawn, walk, power mower, moderate or vigorous effort",
      cardioActivity: CardioActivity.gardening,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Operating snow blower, walking",
      cardioActivity: CardioActivity.gardening,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Shoveling snow, by hand",
      cardioActivity: CardioActivity.gardening,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Shoveling snow, by hand, moderate effort",
      cardioActivity: CardioActivity.gardening,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Shoveling snow, by hand, vigorous effort",
      cardioActivity: CardioActivity.gardening,
      met: 7.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Trimming shrubs or trees, manual cutter",
      cardioActivity: CardioActivity.gardening,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Trimming shrubs or trees, power cutter, using leaf blower, edge, moderate effort",
      cardioActivity: CardioActivity.gardening,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, applying fertilizer or seeding a lawn, push applicator",
      cardioActivity: CardioActivity.gardening,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Watering lawn or garden, standing or walking",
      cardioActivity: CardioActivity.gardening,
      met: 1.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Weeding, cultivating garden",
      cardioActivity: CardioActivity.gardening,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Weeding, cultivating garden, light-to-moderate effort",
      cardioActivity: CardioActivity.gardening,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Weeding, cultivating garden, using a hoe, moderate-to-vigorous effort",
      cardioActivity: CardioActivity.gardening,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Yard work, general, light effort",
      cardioActivity: CardioActivity.gardening,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Yard work, general, moderate effort",
      cardioActivity: CardioActivity.gardening,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Yard work, general, vigorous effort",
      cardioActivity: CardioActivity.gardening,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Marching band, baton twirling, walking, moderate pace, general",
      cardioActivity: CardioActivity.musicPlaying,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Marching band, drum major, walking",
      cardioActivity: CardioActivity.musicPlaying,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Marching band, playing an instrument, walking, brisk pace, general",
      cardioActivity: CardioActivity.musicPlaying,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Active workstation, treadmill desk, walking",
      cardioActivity: CardioActivity.occupation,
      met: 2.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Carrying heavy loads (e.g., bricks, tools)",
      cardioActivity: CardioActivity.occupation,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Carrying moderate loads up stairs, moving boxes approximately 25-49 lbs (11.34 to 22.23 kg)",
      cardioActivity: CardioActivity.occupation,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horse racing, galloping",
      cardioActivity: CardioActivity.occupation,
      met: 7.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horse racing, trotting",
      cardioActivity: CardioActivity.occupation,
      met: 5.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horse racing, walking",
      cardioActivity: CardioActivity.occupation,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Postal carrier, walking to deliver mail",
      cardioActivity: CardioActivity.occupation,
      met: 2.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skindiving or scuba diving as a frogman, navy seal",
      cardioActivity: CardioActivity.occupation,
      met: 12,
      isPreset: true,
    ),
    CardioExercise(
      name: "Jog/walk combination (jogging component of less than 10 minutes)",
      cardioActivity: CardioActivity.running,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Jogging, general",
      cardioActivity: CardioActivity.running,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Jogging, in place",
      cardioActivity: CardioActivity.running,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Jogging, on a mini-tramp",
      cardioActivity: CardioActivity.running,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running",
      cardioActivity: CardioActivity.running,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 10 mph (6 min/mile), 16.09 km/h (3.73 min/km)",
      cardioActivity: CardioActivity.running,
      met: 14.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 11 mph (5.5 min/mile), 17.70 km/h (3.42 min/km)",
      cardioActivity: CardioActivity.running,
      met: 16,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 12 mph (5 min/mile), 19.31 km/h (3.11 min/km)",
      cardioActivity: CardioActivity.running,
      met: 19,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 13 mph (4.6 min/mile), 20.92 km/h (2.86 min/km)",
      cardioActivity: CardioActivity.running,
      met: 19.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 14 mph (4.3 min/mile), 22.53 km/h (2.67 min/km)",
      cardioActivity: CardioActivity.running,
      met: 23,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 4 mph (13 min/mile), 6.44 km/h (8.08 min/km)",
      cardioActivity: CardioActivity.running,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 5 mph (12 min/mile), 8.05 km/h (7.46 min/km)",
      cardioActivity: CardioActivity.running,
      met: 8.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 5.2 mph (11.5 min/mile), 8.37 km/h (7.15 min/km)",
      cardioActivity: CardioActivity.running,
      met: 9,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 6 mph (10 min/mile), 9.66 km/h (6.21 min/km)",
      cardioActivity: CardioActivity.running,
      met: 9.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 6.7 mph (9 min/mile), 10.78 km/h (5.59 min/km)",
      cardioActivity: CardioActivity.running,
      met: 10.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 7 mph (8.5 min/mile), 11.27 km/h (5.28 min/km)",
      cardioActivity: CardioActivity.running,
      met: 11,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 7.5 mph (8 min/mile), 12.07 km/h (4.97 min/km)",
      cardioActivity: CardioActivity.running,
      met: 11.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 8 mph (7.5 min/mile), 12.87 km/h (4.66 min/km)",
      cardioActivity: CardioActivity.running,
      met: 11.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 8.6 mph (7 min/mile), 13.84 km/h (4.35 min/km)",
      cardioActivity: CardioActivity.running,
      met: 12.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, 9 mph (6.5 min/mile), 14.48 km/h (4.04 min/km)",
      cardioActivity: CardioActivity.running,
      met: 12.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, cross country",
      cardioActivity: CardioActivity.running,
      met: 9,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, marathon",
      cardioActivity: CardioActivity.running,
      met: 13.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, on a track, team practice",
      cardioActivity: CardioActivity.running,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, stairs, up",
      cardioActivity: CardioActivity.running,
      met: 15,
      isPreset: true,
    ),
    CardioExercise(
      name: "Running, training, pushing a wheelchair or baby carrier",
      cardioActivity: CardioActivity.running,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Archery, non-hunting",
      cardioActivity: CardioActivity.sports,
      met: 4.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Auto racing, open wheel",
      cardioActivity: CardioActivity.sports,
      met: 8.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Badminton, competitive",
      cardioActivity: CardioActivity.sports,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Badminton, social singles and doubles, general",
      cardioActivity: CardioActivity.sports,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Basketball, drills, practice",
      cardioActivity: CardioActivity.sports,
      met: 9.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Basketball, game",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Basketball, general",
      cardioActivity: CardioActivity.sports,
      met: 6.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Basketball, non-game, general",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Basketball, officiating",
      cardioActivity: CardioActivity.sports,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Basketball, shooting baskets",
      cardioActivity: CardioActivity.sports,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Basketball, wheelchair",
      cardioActivity: CardioActivity.sports,
      met: 7.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bowling",
      cardioActivity: CardioActivity.sports,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bowling, indoor, bowling alley",
      cardioActivity: CardioActivity.sports,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Boxing, in ring, general",
      cardioActivity: CardioActivity.sports,
      met: 12.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Boxing, punching bag",
      cardioActivity: CardioActivity.sports,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Boxing, sparring",
      cardioActivity: CardioActivity.sports,
      met: 7.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Cheerleading, gymnastic moves, competitive",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Children’s games, adults playing (e.g., hopscotch, 4-square, dodgeball, playground apparatus, t-ball, tetherball, marbles, arcade games), moderate effort",
      cardioActivity: CardioActivity.sports,
      met: 5.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Coaching, football, soccer, basketball, baseball, swimming, etc.",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Cricket, batting, bowling, fielding",
      cardioActivity: CardioActivity.sports,
      met: 4.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Croquet",
      cardioActivity: CardioActivity.sports,
      met: 3.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Curling",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Darts, wall or lawn",
      cardioActivity: CardioActivity.sports,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Drag racing, pushing or driving a car",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Fencing",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Football or baseball, playing catch",
      cardioActivity: CardioActivity.sports,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Football, competitive",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Football, touch, flag, general",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Football, touch, flag, light effort",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Frisbee playing, general",
      cardioActivity: CardioActivity.sports,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Frisbee, ultimate",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Golf, general",
      cardioActivity: CardioActivity.sports,
      met: 4.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Golf, miniature, driving range",
      cardioActivity: CardioActivity.sports,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Golf, using power cart",
      cardioActivity: CardioActivity.sports,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Golf, walking, carrying clubs",
      cardioActivity: CardioActivity.sports,
      met: 4.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Golf, walking, pulling clubs",
      cardioActivity: CardioActivity.sports,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Gymnastics, general",
      cardioActivity: CardioActivity.sports,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Handball, general",
      cardioActivity: CardioActivity.sports,
      met: 12,
      isPreset: true,
    ),
    CardioExercise(
      name: "Handball, team",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Hang gliding",
      cardioActivity: CardioActivity.sports,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "High ropes course, multiple elements",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Hockey, field",
      cardioActivity: CardioActivity.sports,
      met: 7.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Hockey, ice, competitive",
      cardioActivity: CardioActivity.sports,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Hockey, ice, general",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horse cart, driving, standing or sitting",
      cardioActivity: CardioActivity.sports,
      met: 1.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Horse chores, feeding, watering, cleaning stalls, implied walking and lifting loads",
      cardioActivity: CardioActivity.sports,
      met: 4.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horseback riding, canter or gallop",
      cardioActivity: CardioActivity.sports,
      met: 7.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horseback riding, general",
      cardioActivity: CardioActivity.sports,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horseback riding, jumping",
      cardioActivity: CardioActivity.sports,
      met: 9,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horseback riding, trotting",
      cardioActivity: CardioActivity.sports,
      met: 5.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horseback riding,walking",
      cardioActivity: CardioActivity.sports,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Horseshoe pitching, quoits",
      cardioActivity: CardioActivity.sports,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Juggling",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Kickball",
      cardioActivity: CardioActivity.sports,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Lacrosse",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Lawn bowling, bocce ball, outdoor",
      cardioActivity: CardioActivity.sports,
      met: 3.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Martial arts, different types, moderate pace (e.g., judo, jujitsu, karate, kick boxing, tae kwan do, tai-bo, muay thai boxing)",
      cardioActivity: CardioActivity.sports,
      met: 10.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Martial arts, different types, slower pace, novice performers, practice",
      cardioActivity: CardioActivity.sports,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Moto-cross, off-road motor sports, all-terrain vehicle, general",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Orienteering",
      cardioActivity: CardioActivity.sports,
      met: 9,
      isPreset: true,
    ),
    CardioExercise(
      name: "Paddleball, casual, general",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Paddleball, competitive",
      cardioActivity: CardioActivity.sports,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Polo, on horseback",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Racquetball, competitive",
      cardioActivity: CardioActivity.sports,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Racquetball, general",
      cardioActivity: CardioActivity.sports,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Rock climbing, ascending or traversing rock, low-to-moderate difficulty",
      cardioActivity: CardioActivity.sports,
      met: 5.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rock climbing, ascending rock, high difficulty",
      cardioActivity: CardioActivity.sports,
      met: 7.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rock climbing, rappelling",
      cardioActivity: CardioActivity.sports,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rock or mountain climbing",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rodeo sports, general, light effort",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rodeo sports, general, moderate effort",
      cardioActivity: CardioActivity.sports,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rodeo sports, general, vigorous effort",
      cardioActivity: CardioActivity.sports,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Rollerblading, in-line skating, 9.0 mph (14.4 km/h), recreational pace",
      cardioActivity: CardioActivity.sports,
      met: 7.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Rollerblading, in-line skating, 11.0 mph (17.7 km/h), moderate pace, exercise training",
      cardioActivity: CardioActivity.sports,
      met: 9.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Rollerblading, in-line skating, 13.0 to 13.6 mph (21.0 to 21.7 km/h), fast pace, exercise training",
      cardioActivity: CardioActivity.sports,
      met: 12.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Rollerblading, in-line skating, 15.0 mph (24.0 km/h), maximal effort",
      cardioActivity: CardioActivity.sports,
      met: 14,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rope jumping, fast pace, 120-160 skips/min",
      cardioActivity: CardioActivity.sports,
      met: 12.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Rope jumping, moderate pace, 100-120 skips/min, general, 2 foot skip, plain bounce",
      cardioActivity: CardioActivity.sports,
      met: 11.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Rope jumping, slow pace, < 100 skips/min, 2 foot skip, rhythm bounce",
      cardioActivity: CardioActivity.sports,
      met: 8.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rugby, touch, non-competitive",
      cardioActivity: CardioActivity.sports,
      met: 6.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Rugby, union, team, competitive",
      cardioActivity: CardioActivity.sports,
      met: 8.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Saddling, cleaning, grooming, harnessing and unharnessing horse",
      cardioActivity: CardioActivity.sports,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Shuffleboard",
      cardioActivity: CardioActivity.sports,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skateboarding, competitive, vigorous effort",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skateboarding, general, moderate effort",
      cardioActivity: CardioActivity.sports,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skating, roller",
      cardioActivity: CardioActivity.sports,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skydiving, base jumping, bungee jumping",
      cardioActivity: CardioActivity.sports,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Soccer, casual, general",
      cardioActivity: CardioActivity.sports,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Soccer, competitive",
      cardioActivity: CardioActivity.sports,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Softball or baseball, fast or slow pitch, general",
      cardioActivity: CardioActivity.sports,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Softball, officiating",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Softball, pitching",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Softball, practice",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Sports spectator, very excited, emotional, physically moving",
      cardioActivity: CardioActivity.sports,
      met: 3.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Squash",
      cardioActivity: CardioActivity.sports,
      met: 12,
      isPreset: true,
    ),
    CardioExercise(
      name: "Squash, general",
      cardioActivity: CardioActivity.sports,
      met: 7.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Table tennis, ping pong",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Tai chi, qi gong, general",
      cardioActivity: CardioActivity.sports,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Tai chi, qi gong, sitting, light effort",
      cardioActivity: CardioActivity.sports,
      met: 1.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Tennis, doubles",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Tennis, doubles",
      cardioActivity: CardioActivity.sports,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Tennis, general",
      cardioActivity: CardioActivity.sports,
      met: 7.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Tennis, hitting balls, non-game play, moderate effort",
      cardioActivity: CardioActivity.sports,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Tennis, singles",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Track and field (e.g., high jump, long jump, triple jump, javelin, pole vault)",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Track and field (e.g., shot, discus, hammer throw)",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Track and field (e.g., steeplechase, hurdles)",
      cardioActivity: CardioActivity.sports,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Trampoline, competitive",
      cardioActivity: CardioActivity.sports,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Trampoline, recreational",
      cardioActivity: CardioActivity.sports,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Volleyball",
      cardioActivity: CardioActivity.sports,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Volleyball, beach, in sand",
      cardioActivity: CardioActivity.sports,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Volleyball, competitive, in gymnasium",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Volleyball, non-competitive, 6 – 9 member team, general",
      cardioActivity: CardioActivity.sports,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Wallyball, general",
      cardioActivity: CardioActivity.sports,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Wrestling (one match = 5 minutes)",
      cardioActivity: CardioActivity.sports,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Backpacking",
      cardioActivity: CardioActivity.walking,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Backpacking, hiking or organized walking with a daypack",
      cardioActivity: CardioActivity.walking,
      met: 7.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Bird watching, slow walk",
      cardioActivity: CardioActivity.walking,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Carrying 1 to 15 lbs (0.45 to 6.80 kg) load, upstairs",
      cardioActivity: CardioActivity.walking,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Carrying 15 lbs (6.80 kg) child, slow walking",
      cardioActivity: CardioActivity.walking,
      met: 2.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Carrying 15 lbs (6.80 kg) load (e.g., suitcase), level ground or downstairs",
      cardioActivity: CardioActivity.walking,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Carrying 16 to 24 lbs (7.26 to 10.89 kg) load, upstairs",
      cardioActivity: CardioActivity.walking,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Carrying 25 to 49 lbs (11.34 to 22.23 kg) load, upstairs",
      cardioActivity: CardioActivity.walking,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Carrying 50 to 74 lbs (22.68 to 33.57 kg) load, upstairs",
      cardioActivity: CardioActivity.walking,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Carrying >74 lbs (33.57 kg) load, upstairs",
      cardioActivity: CardioActivity.walking,
      met: 12,
      isPreset: true,
    ),
    CardioExercise(
      name: "Carrying load upstairs, general",
      cardioActivity: CardioActivity.walking,
      met: 8.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Climbing hills, no load",
      cardioActivity: CardioActivity.walking,
      met: 6.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Climbing hills with 0 to 9 lbs (0 to 4.08 kg) load",
      cardioActivity: CardioActivity.walking,
      met: 6.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Climbing hills with 10 to 20 lbs (4.54 to 9.07 kg) load",
      cardioActivity: CardioActivity.walking,
      met: 7.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Climbing hills with 21 to 42 lbs (9.53 to 19.05 kg) load",
      cardioActivity: CardioActivity.walking,
      met: 8.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Climbing hills with 42+ lbs (19.05+ kg) load",
      cardioActivity: CardioActivity.walking,
      met: 9,
      isPreset: true,
    ),
    CardioExercise(
      name: "Descending stairs",
      cardioActivity: CardioActivity.walking,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Hiking or walking at a normal pace through fields and hillsides",
      cardioActivity: CardioActivity.walking,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Hiking, cross country",
      cardioActivity: CardioActivity.walking,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Loading/unloading a car, implied walking",
      cardioActivity: CardioActivity.walking,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Marching rapidly, military, no pack",
      cardioActivity: CardioActivity.walking,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Marching, moderate speed, military, no pack",
      cardioActivity: CardioActivity.walking,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Pushing a wheelchair, non-occupational",
      cardioActivity: CardioActivity.walking,
      met: 3.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Pushing or pulling stroller with child or walking with children, 2.5 to 3.1 mph (4.02 to 4.99 km/h)",
      cardioActivity: CardioActivity.walking,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Race walking",
      cardioActivity: CardioActivity.walking,
      met: 6.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Stair climbing, fast pace",
      cardioActivity: CardioActivity.walking,
      met: 8.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Stair climbing, slow pace",
      cardioActivity: CardioActivity.walking,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Stair climbing, using or climbing up ladder",
      cardioActivity: CardioActivity.walking,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Using crutches",
      cardioActivity: CardioActivity.walking,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking for pleasure",
      cardioActivity: CardioActivity.walking,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking from house to car or bus, from car or bus to go places, from car or bus to and from the worksite",
      cardioActivity: CardioActivity.walking,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking the dog",
      cardioActivity: CardioActivity.walking,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, 2.0 mph (3.22 km/h), level, slow pace, firm surface",
      cardioActivity: CardioActivity.walking,
      met: 2.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, 2.5 mph (4.02 km/h), downhill",
      cardioActivity: CardioActivity.walking,
      met: 3.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, 2.5 mph (4.02 km/h), level, firm surface",
      cardioActivity: CardioActivity.walking,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking, 2.8 to 3.2 mph (4.51 to 5.15 km/h), level, moderate pace, firm surface",
      cardioActivity: CardioActivity.walking,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking, 2.9 to 3.5 mph (4.67 to 5.63 km/h), uphill, 1 to 5% grade",
      cardioActivity: CardioActivity.walking,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking, 2.9 to 3.5 mph (4.67 to 5.63 km/h), uphill, 6% to 15% grade",
      cardioActivity: CardioActivity.walking,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking, 3.5 mph (5.63 km/h), level, brisk, firm surface, walking for exercise",
      cardioActivity: CardioActivity.walking,
      met: 4.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking, 4.0 mph (6.44 km/h), level, firm surface, very brisk pace",
      cardioActivity: CardioActivity.walking,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking, 4.5 mph (7.24 km/h), level, firm surface, very, very brisk",
      cardioActivity: CardioActivity.walking,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, 5.0 mph (8.05 km/h), level, firm surface",
      cardioActivity: CardioActivity.walking,
      met: 8.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, 5.0 mph (8.05 km/h), uphill, 3% grade",
      cardioActivity: CardioActivity.walking,
      met: 9.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, 3.5 mph (5.63 km/h), backwards, level",
      cardioActivity: CardioActivity.walking,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, 3.5 mph (5.63 km/h), backwards, uphill, 5% grade",
      cardioActivity: CardioActivity.walking,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking, 3.5 to 4.0 mph (5.63 to 6.44 km/h), for exercise, with ski poles, nordic walking, level, moderate pace",
      cardioActivity: CardioActivity.walking,
      met: 4.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking, 5.0 mph (8.05 km/h), for exercise, with ski poles, nordic walking, level, fast pace",
      cardioActivity: CardioActivity.walking,
      met: 9.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, for exercise, with ski poles, nordic walking, uphill",
      cardioActivity: CardioActivity.walking,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, for pleasure, work break",
      cardioActivity: CardioActivity.walking,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, grass track",
      cardioActivity: CardioActivity.walking,
      met: 4.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, household",
      cardioActivity: CardioActivity.walking,
      met: 2,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Walking, less than 2.0 mph (3.22 km/h), level, strolling, very slow",
      cardioActivity: CardioActivity.walking,
      met: 2,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, normal pace, plowed field or sand",
      cardioActivity: CardioActivity.walking,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, to and from an outhouse",
      cardioActivity: CardioActivity.walking,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Walking, to work or class",
      cardioActivity: CardioActivity.walking,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Boating, power, driving",
      cardioActivity: CardioActivity.waterActivities,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Boating, power, passenger, light",
      cardioActivity: CardioActivity.waterActivities,
      met: 1.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Canoeing, harvesting wild rice, knocking rice off the stalks",
      cardioActivity: CardioActivity.waterActivities,
      met: 3.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Canoeing, on camping trip",
      cardioActivity: CardioActivity.waterActivities,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name: "Canoeing, portaging",
      cardioActivity: CardioActivity.waterActivities,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Canoeing, rowing, 2.0 to 3.9 mph (3.22 to 6.28 km/h), light effort",
      cardioActivity: CardioActivity.waterActivities,
      met: 2.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Canoeing, rowing, 4.0 to 5.9 mph (6.44 to 9.50 km/h), moderate effort",
      cardioActivity: CardioActivity.waterActivities,
      met: 5.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Canoeing, rowing, for pleasure, general",
      cardioActivity: CardioActivity.waterActivities,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Canoeing, rowing, in competition, or crew or sculling",
      cardioActivity: CardioActivity.waterActivities,
      met: 12,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Canoeing, rowing, kayaking, competition, >6 mph (>9.66 km/h), vigorous effort",
      cardioActivity: CardioActivity.waterActivities,
      met: 12.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Diving, springboard or platform",
      cardioActivity: CardioActivity.waterActivities,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Jet skiing, driving, in water",
      cardioActivity: CardioActivity.waterActivities,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Kayaking, moderate effort",
      cardioActivity: CardioActivity.waterActivities,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Paddle boarding, standing",
      cardioActivity: CardioActivity.waterActivities,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Paddle boat",
      cardioActivity: CardioActivity.waterActivities,
      met: 4,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Sailing, boat and board sailing, windsurfing, ice sailing, general",
      cardioActivity: CardioActivity.waterActivities,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Sailing, in competition",
      cardioActivity: CardioActivity.waterActivities,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Sailing, sunfish/laser/hobby cat, keel boats, ocean sailing, yachting, leisure",
      cardioActivity: CardioActivity.waterActivities,
      met: 3.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skiing, water or wakeboarding",
      cardioActivity: CardioActivity.waterActivities,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skindiving, fast",
      cardioActivity: CardioActivity.waterActivities,
      met: 15.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skindiving, moderate",
      cardioActivity: CardioActivity.waterActivities,
      met: 11.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skindiving, scuba diving, general",
      cardioActivity: CardioActivity.waterActivities,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Snorkeling",
      cardioActivity: CardioActivity.waterActivities,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Surfing, body or board, competitive",
      cardioActivity: CardioActivity.waterActivities,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Surfing, body or board, general",
      cardioActivity: CardioActivity.waterActivities,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming laps, freestyle, fast, vigorous effort",
      cardioActivity: CardioActivity.waterActivities,
      met: 9.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Swimming laps, freestyle, front crawl, slow, light or moderate effort",
      cardioActivity: CardioActivity.waterActivities,
      met: 5.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, backstroke, general, training or competition",
      cardioActivity: CardioActivity.waterActivities,
      met: 9.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, backstroke, recreational",
      cardioActivity: CardioActivity.waterActivities,
      met: 4.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, breaststroke, general, training or competition",
      cardioActivity: CardioActivity.waterActivities,
      met: 10.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, breaststroke, recreational",
      cardioActivity: CardioActivity.waterActivities,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, butterfly, general",
      cardioActivity: CardioActivity.waterActivities,
      met: 13.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, crawl, fast speed, ~75 yards/minute, vigorous effort",
      cardioActivity: CardioActivity.waterActivities,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, crawl, medium speed, ~50 yards/minute, vigorous effort",
      cardioActivity: CardioActivity.waterActivities,
      met: 8.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, lake, ocean, river",
      cardioActivity: CardioActivity.waterActivities,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, leisurely, not lap swimming, general",
      cardioActivity: CardioActivity.waterActivities,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, sidestroke, general",
      cardioActivity: CardioActivity.waterActivities,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, synchronized",
      cardioActivity: CardioActivity.waterActivities,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, treading water, fast, vigorous effort",
      cardioActivity: CardioActivity.waterActivities,
      met: 9.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Swimming, treading water, moderate effort, general",
      cardioActivity: CardioActivity.waterActivities,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Tubing, floating on a river, general",
      cardioActivity: CardioActivity.waterActivities,
      met: 2.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Water aerobics, water calisthenics",
      cardioActivity: CardioActivity.waterActivities,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Water jogging",
      cardioActivity: CardioActivity.waterActivities,
      met: 9.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Water polo",
      cardioActivity: CardioActivity.waterActivities,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Water volleyball",
      cardioActivity: CardioActivity.waterActivities,
      met: 3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Water walking, light effort, slow pace",
      cardioActivity: CardioActivity.waterActivities,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Water walking, moderate effort, moderate pace",
      cardioActivity: CardioActivity.waterActivities,
      met: 4.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Water walking, vigorous effort, brisk pace",
      cardioActivity: CardioActivity.waterActivities,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Whitewater rafting, kayaking, or canoeing",
      cardioActivity: CardioActivity.waterActivities,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Windsurfing or kitesurfing, crossing trial",
      cardioActivity: CardioActivity.waterActivities,
      met: 11,
      isPreset: true,
    ),
    CardioExercise(
      name: "Windsurfing, competition, pumping for speed",
      cardioActivity: CardioActivity.waterActivities,
      met: 13.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Windsurfing, not pumping for speed",
      cardioActivity: CardioActivity.waterActivities,
      met: 5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Dog sledding, mushing",
      cardioActivity: CardioActivity.winterActivities,
      met: 7.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Dog sledding, passenger",
      cardioActivity: CardioActivity.winterActivities,
      met: 2.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Ice fishing, sitting",
      cardioActivity: CardioActivity.winterActivities,
      met: 2,
      isPreset: true,
    ),
    CardioExercise(
      name: "Moving ice house, set up/drill holes",
      cardioActivity: CardioActivity.winterActivities,
      met: 6,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skating, ice dancing",
      cardioActivity: CardioActivity.winterActivities,
      met: 14,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skating, ice, 9 mph (14.48 km/h) or less",
      cardioActivity: CardioActivity.winterActivities,
      met: 5.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skating, ice, general",
      cardioActivity: CardioActivity.winterActivities,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Skating, ice, rapidly, more than 9 mph (14.48 km/h), not competitive",
      cardioActivity: CardioActivity.winterActivities,
      met: 9,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skating, speed, competitive",
      cardioActivity: CardioActivity.winterActivities,
      met: 13.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Ski jumping, climb up carrying skis",
      cardioActivity: CardioActivity.winterActivities,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Skiing, cross country, >8.0 mph (>12.87 km/h), elite skier, racing",
      cardioActivity: CardioActivity.winterActivities,
      met: 15,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Skiing, cross country, 2.5 mph (4.02 km/h), slow or light effort, ski walking",
      cardioActivity: CardioActivity.winterActivities,
      met: 6.8,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Skiing, cross country, 4.0 to 4.9 mph (6.44 to 7.89 km/h), moderate speed and effort, general",
      cardioActivity: CardioActivity.winterActivities,
      met: 9,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Skiing, cross country, 5.0 to 7.9 mph (8.05 to 12.71 km/h), brisk speed, vigorous effort",
      cardioActivity: CardioActivity.winterActivities,
      met: 12.5,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Skiing, cross country, hard snow, uphill, maximum, snow mountaineering",
      cardioActivity: CardioActivity.winterActivities,
      met: 15.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skiing, cross-country, biathlon, skating technique",
      cardioActivity: CardioActivity.winterActivities,
      met: 13.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skiing, cross-country, skating",
      cardioActivity: CardioActivity.winterActivities,
      met: 13.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Skiing, downhill, alpine or snowboarding, light effort, active time only",
      cardioActivity: CardioActivity.winterActivities,
      met: 4.3,
      isPreset: true,
    ),
    CardioExercise(
      name:
          "Skiing, downhill, alpine or snowboarding, moderate effort, general, active time only",
      cardioActivity: CardioActivity.winterActivities,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skiing, downhill, vigorous effort, racing",
      cardioActivity: CardioActivity.winterActivities,
      met: 8,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skiing, general",
      cardioActivity: CardioActivity.winterActivities,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Skiing, roller, elite racers",
      cardioActivity: CardioActivity.winterActivities,
      met: 12.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Sledding, tobogganing, bobsledding, luge",
      cardioActivity: CardioActivity.winterActivities,
      met: 7,
      isPreset: true,
    ),
    CardioExercise(
      name: "Snow shoeing, moderate effort",
      cardioActivity: CardioActivity.winterActivities,
      met: 5.3,
      isPreset: true,
    ),
    CardioExercise(
      name: "Snow shoeing, vigorous effort",
      cardioActivity: CardioActivity.winterActivities,
      met: 10,
      isPreset: true,
    ),
    CardioExercise(
      name: "Snowmobiling, driving, moderate",
      cardioActivity: CardioActivity.winterActivities,
      met: 3.5,
      isPreset: true,
    ),
    CardioExercise(
      name: "Snowmobiling, passenger",
      cardioActivity: CardioActivity.winterActivities,
      met: 2,
      isPreset: true,
    ),
  ],
);
