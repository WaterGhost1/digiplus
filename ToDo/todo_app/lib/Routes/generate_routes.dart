import 'package:flutter/material.dart';
import 'package:todo_app/Presentation/Screens/landing_screen.dart';
import 'package:todo_app/Presentation/Screens/second_screen.dart';
import 'package:todo_app/Presentation/Screens/todo_screen.dart';
import 'package:todo_app/bloc/bloc/landing_bloc_bloc.dart';

class RouteGenerator {
  final LandingBlocBloc landingscreenbloc = LandingBlocBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
          // (_) => BlocProvider<LandingBlocBloc>.value(
          //   value: landingscreenbloc,
          //   child: LandingScreen(),
          // ),
        );
      case '/secondScreen':
        return MaterialPageRoute(builder: (context) => const SecondScreen());
      case '/todoScreen':
        return MaterialPageRoute(builder: (context) => const TodoScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(body: Center(child: Text('Error')));
      },
    );
  }
}
