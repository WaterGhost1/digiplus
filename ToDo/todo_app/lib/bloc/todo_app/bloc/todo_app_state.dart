part of 'todo_app_bloc.dart';

// para maaccess? tapos parang viewmodel ng kotlin???
@immutable
sealed class TodoAppState {
  final List<String> items;

  const TodoAppState({required this.items});
}

final class TodoAppInitial extends TodoAppState {
  const TodoAppInitial({required super.items});
}

final class TodoListState extends TodoAppState {
  const TodoListState({required super.items});
}

@immutable
abstract class TodoAppState2 {}
class TodoAppInitial2 extends TodoAppState2 {}
class TodoAppLoaded extends TodoAppState2 {
  final List<TodoModel> todos;
  TodoAppLoaded(this.todos);
}
 
