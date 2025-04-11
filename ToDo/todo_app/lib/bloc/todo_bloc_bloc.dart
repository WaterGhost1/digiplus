// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/todo_model.dart';

import 'dart:math';

part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBlocBloc() : super(TodoBlocInitial()) {
    // TODO: implement event handler

    on<AddTodoEvent>((event, emit) {
      final newTodo = ToDo(
        id: Random().nextInt(1000).toString(),
        description: event.description,
      );
      if (state is TodoBlocLoadedState) {
        final updatedTodo = (state as TodoBlocLoadedState).todo.cast<ToDo>();
        emit(TodoBlocLoadedState(updatedTodo));
      } else {
        emit(TodoBlocLoadedState([newTodo]));
      }
    });
    on<ToggleTodoStatusEvent>((event, emit) {
      if (state is TodoBlocLoadedState) {
        final todos = (state as TodoBlocLoadedState).todo;
        final todo = todos.firstWhere((todo) => todo.id == event.todoId);
        todo.isCompleted = !todo.isCompleted;
        emit(TodoBlocLoadedState(List.from(todos)));
      }
    });

    on<DeleteTodoEvent>((event, emit) {
      if (state is TodoBlocLoadedState) {
        final todos =
            (state as TodoBlocLoadedState).todo
                .where((todo) => todo.id != event.todoId)
                .toList();
        emit(TodoBlocLoadedState(todos));
      }
    });
  }
}
