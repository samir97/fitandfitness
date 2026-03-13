import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trend_range.g.dart';

@riverpod
class TrendRange extends _$TrendRange {
  @override
  Duration build() => const Duration(days: 7);

  void update(Duration duration) => state = duration;
}
