import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

part 'mood_sentiment.freezed.dart';

part 'mood_sentiment.g.dart';

@freezed
class MoodSentiment with _$MoodSentiment {
  const MoodSentiment._();

  const factory MoodSentiment({
    required String icon,
    required String name,
  }) = _MoodSentiment;

  static Set<MoodSentiment> get all => {
        const MoodSentiment(icon: "😀", name: "happy"),
        const MoodSentiment(icon: "🤫", name: "confident"),
        const MoodSentiment(icon: "😌", name: "calm"),
        const MoodSentiment(icon: "⚡️", name: "energetic"),
        const MoodSentiment(icon: "😁", name: "excited"),
        const MoodSentiment(icon: "🙄", name: "irritable"),
        const MoodSentiment(icon: "🙌", name: "blessed"),
        const MoodSentiment(icon: "😴", name: "tired"),
        const MoodSentiment(icon: "🥺", name: "sensitive"),
        const MoodSentiment(icon: "😶", name: "numb"),
        const MoodSentiment(icon: "😔", name: "sad"),
        const MoodSentiment(icon: "🙂", name: "good"),
        const MoodSentiment(icon: "😕", name: "confused"),
        const MoodSentiment(icon: "😑", name: "bored"),
        const MoodSentiment(icon: "🙃", name: "awkward"),
        const MoodSentiment(icon: "😣", name: "stressed"),
        const MoodSentiment(icon: "😠", name: "angry"),
        const MoodSentiment(icon: "😓", name: "anxious"),
      };

  @override
  String toString() => toBeginningOfSentenceCase(name) ?? "";

  factory MoodSentiment.fromJson(Map<String, dynamic> json) =>
      _$MoodSentimentFromJson(json);
}
