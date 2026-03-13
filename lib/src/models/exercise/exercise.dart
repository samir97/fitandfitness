abstract class Exercise {
  final String name;
  final DateTime? recordedAt;

  const Exercise(this.name, this.recordedAt);
}

abstract class ExerciseEntry {
  final String? id;
  final Exercise exercise;
  final DateTime recordedAt;

  const ExerciseEntry(this.id, this.exercise, this.recordedAt);

  String summary();
}
