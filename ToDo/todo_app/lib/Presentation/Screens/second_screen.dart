import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc/landing_bloc_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final int count = 0;
    return SafeArea(
      child: BlocBuilder<LandingBlocBloc, LandingBlocState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.teal),
            body: Text('Count: ${state.count}'),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<LandingBlocBloc>().add(Increment());
                  },
                  child: Icon(Icons.add),
                ),

                SizedBox(height: 15),

                ElevatedButton(
                  onPressed: () {
                    context.read<LandingBlocBloc>().add(Decrement());
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
      // child: Scaffold(
      //   appBar: AppBar(backgroundColor: Colors.teal),
      //   body: Center(child: Text('Count: $count')),
      // ),
    );
  }
}
