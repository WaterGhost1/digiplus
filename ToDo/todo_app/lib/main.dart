import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/Routes/generate_routes.dart';
import 'package:todo_app/bloc/bloc/landing_bloc_bloc.dart';
import 'package:todo_app/bloc/todo_app/bloc/todo_app_bloc.dart';
import 'package:todo_app/bloc/user_bloc/bloc/user_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/model/user_model.dart';
import 'package:todo_app/repository/todo_repo.dart';
import 'package:todo_app/repository/user_repo.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todoBox');
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('userBox');


  final todoRepo = TodoRepo();

  final userRepo = UserRepo();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LandingBlocBloc()),
        // BlocProvider(create: (context) => TodoAppBloc()),
        BlocProvider(create: (context) => TodoAppBloc2(todoRepo)..add(LoadTodos())),
        BlocProvider(create: (context) => UserBloc(userRepo)..add(GetUsers())),

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
      initialRoute: '/loginScreen',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
