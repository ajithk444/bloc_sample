import 'package:bloc/bloc.dart';
import 'package:bloc_example/events/counter_event.dart';
import 'package:bloc_example/state/counter_state.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  void onIncrement() {
    dispatch(IncrementEvent());
  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }

  @override
  CounterState get initialState => CounterState.initial();

  
  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield CounterState(counter: currentState.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(counter: currentState.counter - 1);
    }
  }
}
