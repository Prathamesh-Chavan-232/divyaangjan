import 'package:flutter/material.dart';

import '/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.person),
            label: const Text("Sign out"),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black)),
          )
        ],
      ),
      body: Column(),
    );
  }
}
