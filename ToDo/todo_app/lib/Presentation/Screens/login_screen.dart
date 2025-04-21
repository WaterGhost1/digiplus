import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/user_bloc/bloc/user_bloc.dart';
import 'package:todo_app/model/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserValid){
          Navigator.pushNamed(context, '/');
        } else if (state is UserInvalid){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials')));
        }
      },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final username = usernameController.text.trim();
                        final password = passwordController.text.trim();
                        if(username.isNotEmpty && password.isNotEmpty){
                          context.read<UserBloc>().add(IsValid(username, password));
                        }
                        
                      },
                      child: Text("login"),
                    ),
                    SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        final username = usernameController.text.trim();
                        final password = passwordController.text.trim();
                        if (username.isNotEmpty && password.isNotEmpty) {
                          final user = UserModel(
                            username: username,
                            password: password,
                          );
                          context.read<UserBloc>().add(AddUser(user));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account Created')));

                          usernameController.clear();
                          passwordController.clear();
                        }
                        

                        // Navigator.pushNamed(context, '/');
                      },
                      child: Text("create account"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      
    );
  }
}
