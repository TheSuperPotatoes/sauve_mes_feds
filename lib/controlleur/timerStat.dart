import 'package:riverpod/riverpod.dart';
import "dart:async";

enum ButtonState {
  STARTED,
  PAUSED,
  FINISHED,
}

class TimerManager {
  TimerManager({required this.timeLeft, required this.buttonState});
  int timeLeft;
  ButtonState buttonState;

  TimerManager copyWith({int? timeLeft, ButtonState? buttonState}) {
    return TimerManager(
      timeLeft: timeLeft ?? this.timeLeft,
      buttonState: buttonState ?? this.buttonState,
    );
  }
}

final timerProvider = StateNotifierProvider<TimerNotifier, TimerManager>(
    (ref) => TimerNotifier());

class TimerNotifier extends StateNotifier<TimerManager> {
  TimerNotifier()
      : super(TimerManager(
            timeLeft: _initialDuration, buttonState: _initButtonState));

  static const int _initialDuration = 13 * 60;
  static const ButtonState _initButtonState = ButtonState.PAUSED;

  Timer? _timer;
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose;
  }

  void startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (state.timeLeft > 0) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
        print(state.timeLeft);
      } else {
        _timer?.cancel();
        print("fin du compteur");
      }
    });
  }

  void restart() {
    _timer?.cancel();
    state = state.copyWith(
        timeLeft: _initialDuration, buttonState: _initButtonState);
  }

  void timerManager() {
    switch (state.buttonState) {
      case ButtonState.STARTED:
        paused();
        state =
            state.copyWith(buttonState: state.buttonState = ButtonState.PAUSED);
      case ButtonState.PAUSED:
        startTimer();
        state = state.copyWith(
            buttonState: state.buttonState = ButtonState.STARTED);
      default:
        break;
    }
  }

  void paused() {
    _timer?.cancel();
  }
}
