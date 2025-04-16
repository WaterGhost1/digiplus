import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_app_event.dart';
part 'todo_app_state.dart';

class TodoAppBloc extends Bloc<TodoAppEvent, TodoAppState> {
  TodoAppBloc() : super(TodoAppInitial(items: [])) {
    on<AddItem>((event, emit) {
      final updatedList = List<String>.from(state.items)..add(event.item);
      emit(TodoListState(items: updatedList));
    });

    on<RemoveItem>((event, emit) {
      final updatedList = List<String>.from(state.items)..remove(event.item);
      emit(TodoListState(items: updatedList));
    });
  }
}
