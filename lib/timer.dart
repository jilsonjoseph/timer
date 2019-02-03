class Timer{

  final Duration maxTime;
  Duration _currentTime = const Duration(seconds:0);
  TimerState state = TimerState.ready;

  Timer({
    this.maxTime,
});

  Duration get currentTime => _currentTime;

  set currentTime(Duration value) {
    if(state == TimerState.ready){
      _currentTime = value;
    }
  }


}

enum TimerState{
  ready,
  running,
  paused,
}