import 'package:calculator_flutter/data/notifiers.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  final String username;
  final String password;
  const NavbarWidget({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.person, color: Colors.black),
              label: 'Profile',
            ),
          ],
          backgroundColor: Colors.teal,
          indicatorColor: Colors.tealAccent,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white),
          ),
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
