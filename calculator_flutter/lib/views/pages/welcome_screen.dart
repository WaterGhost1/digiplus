import 'package:calculator_flutter/main.dart' show RootPage;
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Color(0xff2148c0)),
            Image.asset(
              'assets/images/welcome_bg.png',
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: username,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        'Username',
                        style: TextStyle(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outlined,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  Divider(height: 20, color: Colors.transparent),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                      border: OutlineInputBorder(),
                      label: Text(
                        'Password',
                        style: TextStyle(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  Divider(height: 20, color: Colors.transparent),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => RootPage(
                                username: username.text,
                                password: password.text,
                              ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Colors.white,
                        width: 350,
                        height: 40,
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Color(0xff2148c0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        print('Forget Password clicked');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
