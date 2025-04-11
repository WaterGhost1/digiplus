part of 'todo_bloc_bloc.dart';

@immutable
sealed class TodoBlocEvent {}

class AddTodoEvent extends TodoBlocEvent {
  final String description;
  AddTodoEvent(this.description);
}

class ToggleTodoStatusEvent extends TodoBlocEvent {
  final String todoId;
  ToggleTodoStatusEvent(this.todoId);
}

class DeleteTodoEvent extends TodoBlocEvent {
  final String todoId;
  DeleteTodoEvent(this.todoId);
}
