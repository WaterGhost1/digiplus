part of 'todo_app_bloc.dart';

// here is the functions
@immutable
sealed class TodoAppEvent {}

class AddItem extends TodoAppEvent {
  final String item;
  AddItem(this.item);
}

class RemoveItem extends TodoAppEvent {
  final String item;
  RemoveItem(this.item);
}
