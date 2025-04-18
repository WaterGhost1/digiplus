import 'package:hive/hive.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoRepo {
  final Box<TodoModel> todoBox = Hive.box<TodoModel>('todoBox');

  List<TodoModel> getTodo(){
    return todoBox.values.toList();
  }

  Future<void> addTodo(TodoModel todo) async{
    await todoBox.add(todo);
  }

  Future<void> deleteTodo(int index) async{
    await todoBox.deleteAt(index);
  }

  Future<void>  toggleTodo(int index) async{
    final todo = todoBox.getAt(index);
    if (todo != null){
      todo.isCompleted = !todo.isCompleted;
      await todo.save();
    }
  }
}