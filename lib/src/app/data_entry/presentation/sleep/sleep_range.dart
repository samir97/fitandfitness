class SleepRange {
  int _startTimeInMinutes = 0;
  int _endTimeInMinutes = 0;

  SleepRange(int startTimeInMinutes, int endTimeInMinutes) {
    _startTimeInMinutes = _clipTimeToRange(startTimeInMinutes);
    _endTimeInMinutes = _clipTimeToRange(endTimeInMinutes);
    _adjustTimeRange();
  }

  int get startTimeInMinutes => _startTimeInMinutes;

  int get endTimeInMinutes => _endTimeInMinutes;

  set startTimeInMinutes(int value) {
    _startTimeInMinutes = _clipTimeToRange(value);
    _adjustTimeRange();
  }

  set endTimeInMinutes(int value) {
    _endTimeInMinutes = _clipTimeToRange(value);
    _adjustTimeRange();
  }

  int _clipTimeToRange(int timeInMinutes) {
    return timeInMinutes.clamp(60, 20 * 60);
  }

  void _adjustTimeRange() {
    if (_startTimeInMinutes >= _endTimeInMinutes) {
      _endTimeInMinutes = (_startTimeInMinutes + 60) % (24 * 60);
    }
  }
}
