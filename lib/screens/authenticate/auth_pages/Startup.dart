import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.asset("lib/assets/welcome_screen.jpg"),
            const SizedBox(height: 20),
            button("LOGIN"),
            const SizedBox(height: 20),
            button("SIGN UP"),
          ],
        ),
      ),
    );
  }

  Widget button(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xffef6b2d))
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          )),
    );
  }
}
