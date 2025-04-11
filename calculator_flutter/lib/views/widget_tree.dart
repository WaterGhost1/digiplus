import 'package:calculator_flutter/data/notifiers.dart';
import 'package:calculator_flutter/views/pages/home_page.dart';
import 'package:calculator_flutter/views/pages/profile_page.dart';
import 'package:calculator_flutter/views/widgets/navbar_widget.dart'
    show NavbarWidget;
import 'package:flutter/material.dart';

List<Widget> pages(String username, String password) {
  return [HomePage(), ProfilePage(username: username, password: password)];
}

class WidgetTree extends StatelessWidget {
  final String username;
  final String password;
  const WidgetTree({required this.username, required this.password, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon Screen'),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
              onPressed: () {
                isDarModeNotifier.value = !isDarModeNotifier.value;
              },
              icon: ValueListenableBuilder(
                valueListenable: isDarModeNotifier,
                builder: (context, isDarkMode, child) {
                  return Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode);
                },
              ),
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, value, child) {
            return pages(username, password).elementAt(value);
          },
        ),
        bottomNavigationBar: NavbarWidget(
          username: username,
          password: password,
        ),
      ),
    );
  }
}
