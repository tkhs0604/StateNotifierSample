import 'package:state_notifier/state_notifier.dart';

class CounterState {
  CounterState(this.count);
  final int count;
}

class CounterController extends StateNotifier<CounterState> {
  CounterController() : super(CounterState(0));

  void increment() {
    state = CounterState(state.count + 1);
  }
}
