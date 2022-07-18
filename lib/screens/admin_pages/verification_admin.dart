import 'package:flutter/material.dart';

class AdminSideVerification extends StatelessWidget {
  const AdminSideVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4C43A6),
          title: const Text("Profile Verification"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
        ));
  }
}
