import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/Routes/generate_routes.dart';
import 'package:todo_app/bloc/bloc/landing_bloc_bloc.dart';
import 'package:todo_app/bloc/todo_app/bloc/todo_app_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/repository/todo_repo.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todoBox');

  final todoRepo = TodoRepo();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LandingBlocBloc()),
        // BlocProvider(create: (context) => TodoAppBloc()),
        BlocProvider(create: (context) => TodoAppBloc2(todoRepo)..add(LoadTodos())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
