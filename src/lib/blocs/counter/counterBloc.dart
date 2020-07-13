import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'counterEvent.dart';
import 'counterState.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield CounterState(state.value - 1);
        break;
      case CounterEvent.increment:
        yield CounterState(state.value + 1);
        break;
      case CounterEvent.reset:
        yield CounterState(0);
        break;
    }
  }

  @override
  CounterState fromJson(Map<String, dynamic> source) {
    return CounterState(
      source['value'] as int,
    );
  }

  @override
  Map<String, int> toJson(CounterState state) {
    return {
      'value': state.value,
    };
  }
}
