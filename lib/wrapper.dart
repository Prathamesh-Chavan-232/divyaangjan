import 'package:divyajaan/screens/requests_screen/user_requests.dart';

import '/screens/authenticate/auth.dart';
import '/models/users.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);
    // Return either Home or Auth widget.
    if (user == null) {
      return const Auth();
    } else {
      return const UserRequests();
    }
  }
}
