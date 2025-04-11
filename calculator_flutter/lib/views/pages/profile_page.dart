import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String password;
  const ProfilePage({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              print(widget.username);
            },
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.black45),
              title: Text(
                widget.username,
                style: TextStyle(color: Colors.black45),
              ),
              tileColor: Colors.tealAccent,
            ),
          ),
        ],
      ),
    );
  }
}
