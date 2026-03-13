import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

part 'mood_activity.freezed.dart';

part 'mood_activity.g.dart';

@freezed
class MoodActivity with _$MoodActivity {
  const MoodActivity._();

  const factory MoodActivity({
    required String icon,
    required String name,
  }) = _MoodActivity;

  static Set<MoodActivity> get all => {
        const MoodActivity(icon: "💼", name: "work"),
        const MoodActivity(icon: "🏠", name: "family"),
        const MoodActivity(icon: "👥", name: "friends"),
        const MoodActivity(icon: "🎹", name: "music"),
        const MoodActivity(icon: "🍴", name: "food"),
        const MoodActivity(icon: "🛏", name: "sleep"),
        const MoodActivity(icon: "⛅️", name: "weather"),
        const MoodActivity(icon: "📚", name: "school"),
        const MoodActivity(icon: "🕹", name: "gaming"),
        const MoodActivity(icon: "🧳", name: "travelling"),
        const MoodActivity(icon: "🏅", name: "hobbies"),
        const MoodActivity(icon: "🛍", name: "shopping"),
        const MoodActivity(icon: "❤️", name: "relationship"),
        const MoodActivity(icon: "💪", name: "exercise"),
        const MoodActivity(icon: "🏥", name: "health"),
        const MoodActivity(icon: "🏖", name: "relaxing"),
        const MoodActivity(icon: "📖", name: "reading")
      };

  @override
  String toString() => toBeginningOfSentenceCase(name) ?? "";

  factory MoodActivity.fromJson(Map<String, dynamic> json) =>
      _$MoodActivityFromJson(json);
}
