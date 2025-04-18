import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_app/bloc/todo_app_bloc.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TodoAppBloc2, TodoAppState2>(
        builder: (context, state) {
          final item = TextEditingController();
          List<TodoModel> todos = [];
          if (state is TodoAppLoaded){
            todos = state.todos;
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Todo Screen'),
              backgroundColor: Colors.teal,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: item,
                          // decoration: InputDecoration(labelText: 'Enter text'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final description = item.text.trim();
                          if (description.isNotEmpty){
                            final todo = TodoModel(description: description, isCompleted: false);
                            context.read<TodoAppBloc2>().add(AddTodo(todo));
                            item.clear();
                          }
                        },
                        child: Text("add"),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final item = todos[index];
                        return ListTileDecor(
                          item: item,
                          index: index,
                          onToggle: (){context.read<TodoAppBloc2>().add(ToggleTodo(index));},
                          onDelete: (){context.read<TodoAppBloc2>().add(DeleteTodo(index));},
                        );
                        // return ListTile(
                        //   title: Text(item.description, style: TextStyle(
                        //     decoration: item.isCompleted ? TextDecoration.lineThrough : TextDecoration.none
                        //   ),),
                        //   leading: IconButton(onPressed: (){
                        //     context.read<TodoAppBloc2>().add(ToggleTodo(index));
                        //   }, icon: Icon(
                        //     item.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                        //     color: item.isCompleted ? Colors.green : Colors.grey,
                        //   )),
                          
                        //   trailing: IconButton(onPressed: (){
                        //     context.read<TodoAppBloc2>().add(DeleteTodo(index));

                        //   }, icon: Icon(Icons.delete)),
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListTileDecor extends StatelessWidget {
  final TodoModel item;
  final int index;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const ListTileDecor({
    super.key, 
  required this.item, 
  required this.index, 
  required this.onToggle, 
  required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.description, style: TextStyle(
                            decoration: item.isCompleted ? TextDecoration.lineThrough : TextDecoration.none
                          ),),
      leading: IconButton(onPressed: onToggle, icon: Icon(
        item.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
        color: item.isCompleted ? Colors.green : Colors.grey,
      )),
      
      trailing: IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),

    );
  }
}



//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BlocBuilder<TodoAppBloc, TodoAppState>(
//         builder: (context, state) {
//           final item = TextEditingController();
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Todo Screen'),
//               backgroundColor: Colors.teal,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: item,
//                           // decoration: InputDecoration(labelText: 'Enter text'),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           context.read<TodoAppBloc>().add(
//                             AddItem(item.text.trim()),
//                           );
//                         },
//                         child: Text("add"),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: state.items.length,
//                       itemBuilder: (context, index) {
//                         final item = state.items[index];
//                         return ListTile(
//                           title: Text(item),
//                           // onTap: () {
//                           //   context.read<TodoAppBloc>().add(RemoveItem(item));
//                           // },
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
