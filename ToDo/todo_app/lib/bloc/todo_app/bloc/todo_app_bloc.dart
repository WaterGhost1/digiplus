import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/repository/todo_repo.dart';

part 'todo_app_event.dart';
part 'todo_app_state.dart';

// class TodoAppBloc extends Bloc<TodoAppEvent, TodoAppState> {
//   TodoAppBloc() : super(TodoAppInitial(items: [])) {
//     on<AddItem>((event, emit) {
//       final updatedList = List<String>.from(state.items)..add(event.item);
//       emit(TodoListState(items: updatedList));
//     });

//     on<RemoveItem>((event, emit) {
//       final updatedList = List<String>.from(state.items)..remove(event.item);
//       emit(TodoListState(items: updatedList));
//     });
//   }
// }


class TodoAppBloc2 extends Bloc<TodoAppEvent, TodoAppState2>{
  final TodoRepo todoRepo;
  TodoAppBloc2(this.todoRepo) : super(TodoAppInitial2()){
    on<LoadTodos>((event, emit) {
      final todos = todoRepo.getTodo();
      emit(TodoAppLoaded(todos));
    },);

    on<AddTodo>((event, emit) async {
      await todoRepo.addTodo(event.todo);
      add(LoadTodos());

    });

    on<DeleteTodo>((event, emit) async{
      await todoRepo.deleteTodo(event.index);
      add(LoadTodos());
    });


    on<ToggleTodo>((event, emit) async{
      await todoRepo.toggleTodo(event.index);
      add(LoadTodos());
    });
  }
}
