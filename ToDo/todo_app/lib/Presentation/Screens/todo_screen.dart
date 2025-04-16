import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_app/bloc/todo_app_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TodoAppBloc, TodoAppState>(
        builder: (context, state) {
          final item = TextEditingController();
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
                          context.read<TodoAppBloc>().add(
                            AddItem(item.text.trim()),
                          );
                        },
                        child: Text("add"),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return ListTile(
                          title: Text(item),
                          // onTap: () {
                          //   context.read<TodoAppBloc>().add(RemoveItem(item));
                          // },
                        );
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
