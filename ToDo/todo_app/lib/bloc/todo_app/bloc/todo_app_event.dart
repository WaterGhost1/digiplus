part of 'todo_app_bloc.dart';

// here is the functions
@immutable
sealed class TodoAppEvent {}

// class AddItem extends TodoAppEvent {
//   final String item;
//   AddItem(this.item);
// }

// class RemoveItem extends TodoAppEvent {
//   final String item;
//   RemoveItem(this.item);
// }

class LoadTodos extends TodoAppEvent{}

class AddTodo extends TodoAppEvent{
  final TodoModel todo;
  AddTodo(this.todo);
}

class DeleteTodo extends TodoAppEvent{
  final int index;
  DeleteTodo(this.index);
}

class ToggleTodo extends TodoAppEvent{
  final int index;
  ToggleTodo(this.index);
}