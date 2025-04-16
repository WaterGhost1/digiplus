import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/bloc/landing_bloc_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LandingBlocBloc, LandingBlocState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text(
                "Landing Screen",
                style: TextStyle(color: Colors.white),
              ),
            ),

            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'secondScreen',
                  onPressed: () {
                    Navigator.pushNamed(context, '/secondScreen');
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 15),
                FloatingActionButton(
                  heroTag: 'todoScreen',
                  onPressed: () {
                    // print('clicked');
                    Navigator.pushNamed(context, '/todoScreen');
                  },
                  child: Icon(Icons.task),
                ),
              ],
            ),
            body: Center(child: bottomnavScreen.elementAt(state.tabIndex)),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              backgroundColor: Colors.lightBlueAccent,
              unselectedItemColor: Colors.blueGrey,
              selectedItemColor: Colors.teal,
              onTap: (index) {
                BlocProvider.of<LandingBlocBloc>(
                  context,
                ).add(TabChange(tabIndex: index));
              },
            ),
          );
        },
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.grid_3x3), label: 'Category'),
  BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: 'Favourite',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    label: 'Cart',
  ),
];

const List<Widget> bottomnavScreen = <Widget>[
  Text('Index 0: Home'),
  Text('Index 1: Category'),
  Text('Index 2: Search'),
  Text('Index 3: Favourite'),
  Text('Index 4: Cart'),
];
