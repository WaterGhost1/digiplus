import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landing_bloc_event.dart';
part 'landing_bloc_state.dart';

class LandingBlocBloc extends Bloc<LandingBlocEvent, LandingBlocState> {
  LandingBlocBloc() : super(LandingBlocInitial(tabIndex: 0, count: 0)) {
    // on<LandingBlocEvent>((event, emit) {
    //   if (event is TabChange) {
    //     emit(LandingBlocInitial(tabIndex: event.tabIndex, count: state.count));
    //   }
    //   if (event is Increment) {
    //     emit(CounterState(count: state.count + 1, tabIndex: state.tabIndex));
    //   }
    // });
    on<TabChange>((event, emit) {
      emit(LandingBlocInitial(tabIndex: event.tabIndex, count: state.count));
    });

    on<Increment>((event, emit) {
      emit(CounterState(count: state.count + 1, tabIndex: state.tabIndex));
    });

    on<Decrement>((event, emit) {
      emit(CounterState(count: state.count - 1, tabIndex: state.tabIndex));
    });
  }
}
