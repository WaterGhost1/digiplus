import 'package:calculator_flutter/data/notifiers.dart';
import 'package:calculator_flutter/views/pages/welcome_screen.dart';
import 'package:calculator_flutter/views/widget_tree.dart' show WidgetTree;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder(
      valueListenable: isDarModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.transparent,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
            textTheme: GoogleFonts.montserratTextTheme(),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}

class RootPage extends StatefulWidget {
  final String username;
  final String password;

  const RootPage({super.key, required this.username, required this.password});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                title: Text('Snorlax the First'),
                tileColor: Colors.blue,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage()),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.black),
                  title: Text('LOGOUT', style: TextStyle(color: Colors.black)),
                  tileColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Flutter'),
          backgroundColor: Colors.teal,
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/bg.jpg',
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 300,
              left: 180,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'RAWR!!!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.username,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => WidgetTree(
                      username: widget.username,
                      password: widget.password,
                    ),
              ),
            );
            debugPrint("FAB Clicked!");
          },
          backgroundColor: Colors.teal,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: NavigationBar(
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
        ),
      ),
    );
  }
}

//https://www.youtube.com/watch?v=3kaGC_DrUnw
