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
    if (state != TimerState.running){
      if(state == TimerState.ready){
        _currentTime = _roundToTheNearestMinute(_currentTime);
        lastStartTime = _currentTime;
      }

      state = TimerState.running;
      stopwatch.start();
      _tick();
    }

  }

  _roundToTheNearestMinute(duration){
    return Duration(
        minutes: (duration.inSeconds / 60).round()
    );
  }

  pause(){
    if(state == TimerState.running) {
      state = TimerState.paused;
      stopwatch.stop();

      if (null != onTimerUpdate){
        onTimerUpdate();
      }
    }
  }

  restart(){
    if(state == TimerState.paused){
      state = TimerState.running;
      _currentTime = lastStartTime;
      stopwatch.reset();
      stopwatch.start();

      _tick();
    }
  }

  reset(){
    if (state == TimerState.paused){
      state = TimerState.ready;
      _currentTime = const Duration(seconds: 0);
      lastStartTime = _currentTime;
      stopwatch.reset();

      if(null != onTimerUpdate){
        onTimerUpdate();
      }
    }
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