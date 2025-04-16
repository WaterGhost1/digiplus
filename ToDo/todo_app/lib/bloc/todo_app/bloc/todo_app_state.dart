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
