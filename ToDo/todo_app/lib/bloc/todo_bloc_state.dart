part of 'todo_bloc_bloc.dart';

@immutable
sealed class TodoBlocState {}

class TodoBlocInitial extends TodoBlocState {}

class TodoBlocLoadedState extends TodoBlocState {
  final List<ToDo> todo;
  TodoBlocLoadedState(this.todo);
}
