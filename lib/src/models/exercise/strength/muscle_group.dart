import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum MuscleGroup {
  @JsonValue('abdominals_lower')
  abdominalsLower,
  @JsonValue('abdominals_obliques')
  abdominalsObliques,
  @JsonValue('abdominals_total')
  abdominalsTotal,
  @JsonValue('abdominals_upper')
  abdominalsUpper,
  @JsonValue('back_latissimus_dorsi')
  backLatissimusDorsi,
  @JsonValue('back_lat_dorsi_or_rhomboids')
  backLatDorsiOrRhomboids,
  @JsonValue('biceps')
  biceps,
  @JsonValue('calves_gastrocnemius')
  calvesGastrocnemius,
  @JsonValue('calves_soleus')
  calvesSoleus,
  @JsonValue('chest_pectoralis')
  chestPectoralis,
  @JsonValue('legs_hamstrings')
  legsHamstrings,
  @JsonValue('legs_quadriceps')
  legsQuadriceps,
  @JsonValue('lower_back_erector_spinae')
  lowerBackErectorSpinae,
  @JsonValue('shoulders_delts_or_traps')
  shouldersDeltsOrTraps,
  @JsonValue('shoulders_rotator_cuff')
  shouldersRotatorCuff,
  @JsonValue('triceps')
  triceps;

  static List<String> get stringValues =>
      MuscleGroup.values.map((e) => e.toString()).toList();

  @override
  String toString() {
    switch (this) {
      case MuscleGroup.abdominalsLower:
        return "Abdominals lower";
      case MuscleGroup.abdominalsObliques:
        return "Abdominals obliques";
      case MuscleGroup.abdominalsTotal:
        return "Abdominals total";
      case MuscleGroup.abdominalsUpper:
        return "Abdominals upper";
      case MuscleGroup.backLatissimusDorsi:
        return "Back latissimus dorsi";
      case MuscleGroup.backLatDorsiOrRhomboids:
        return "Back lat dorsi or rhomboids";
      case MuscleGroup.biceps:
        return "Biceps";
      case MuscleGroup.calvesGastrocnemius:
        return "Calves gastrocnemius";
      case MuscleGroup.calvesSoleus:
        return "Calves soleus";
      case MuscleGroup.chestPectoralis:
        return "Chest pectoralis";
      case MuscleGroup.legsHamstrings:
        return "Legs hamstrings";
      case MuscleGroup.legsQuadriceps:
        return "Legs quadriceps";
      case MuscleGroup.lowerBackErectorSpinae:
        return "Lower back erector spinae";
      case MuscleGroup.shouldersDeltsOrTraps:
        return "Shoulders delts or traps";
      case MuscleGroup.shouldersRotatorCuff:
        return "Shoulders rotator cuff";
      case MuscleGroup.triceps:
        return "Triceps";
    }
  }

  static MuscleGroup? fromString(String? value) {
    if (value == null) return null;
    return MuscleGroup.values.firstWhereOrNull((e) => e.toString() == value);
  }
}
