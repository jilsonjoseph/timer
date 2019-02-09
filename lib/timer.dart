import 'dart:async' as async ;
class Timer{

  final Duration maxTime;
  final Function onTimerUpdate;
  final Stopwatch stopwatch = Stopwatch();
  Duration _currentTime = const Duration(seconds:0);
  Duration lastStartTime = const Duration(seconds: 0);
  TimerState state = TimerState.ready;

  Timer({
    this.maxTime,
    this.onTimerUpdate,
});

  Duration get currentTime => _currentTime;

  set currentTime(Duration value) {
    if(state == TimerState.ready){
      _currentTime = value;
      lastStartTime = currentTime;
    }
  }

  resume(){
    state = TimerState.running;
    stopwatch.start();
    _tick();
  }

  pause(){

  }

  _tick(){
    print('Current time: ${_currentTime.inSeconds}');
    _currentTime = lastStartTime - stopwatch.elapsed;

    if (_currentTime.inSeconds > 0){
       async.Timer(const Duration(seconds: 1), _tick);
    }else{
      state = TimerState.ready;
    }

    if(onTimerUpdate != null){
      onTimerUpdate();
    }

  }

}

enum TimerState{
  ready,
  running,
  paused,
}