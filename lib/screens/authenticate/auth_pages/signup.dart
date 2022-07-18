import '/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  const SignUp({required this.toggleView, Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _pass;
  late bool _hidePassword;

  @override
  void initState() {
    _email = '';
    _pass = '';
    _hidePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                    "CREATE ACCOUNT!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 60),
              Stack(
                children: [
                  Image.asset("lib/assets/sign_up.jpg"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        _buildNormalField(hintText: "Email"),
                        const SizedBox(height: 20),
                        _buildPasswordField(hintText: "Password"),
                        const SizedBox(height: 20),
                        _buildPasswordField(hintText: "Confirm Password"),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: _signUpButton(),
                ),
              ),
              _switchToLogin(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _signUpButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xffef6b2d))),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          dynamic result = await _auth.signup("", "", _email, _pass);
          print("email : $_email");
          print("pass : $_pass");
          if (result != null) {
            print("$result, Successfully signed up with email & password");
            print(result.userId);
          } else {
            print("Error in registering ");
          }
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
        child: Text(
          "SIGN UP",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }

  Row _switchToLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?",
            style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: () {
            widget.toggleView();
          },
          child: const Text(
            "Login",
            style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.grey[100]),
          ),
        )
      ],
    );
  }

  TextFormField _buildNormalField({required String hintText}) {
    return TextFormField(
      onChanged: (val) {
        setState(() => _email = val);
      },
      decoration: InputDecoration(
          hintText: "Email",
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0),
          )),
    );
  }

  TextFormField _buildPasswordField({required String hintText}) {
    return TextFormField(
      validator: (val) =>
          val!.length < 6 ? "Password must have at least 6 characters" : null,
      onChanged: (val) {
        setState(() => _pass = val);
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() => _hidePassword = !_hidePassword);
            },
            icon: Icon(_hidePassword ? Icons.visibility_off : Icons.visibility),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0),
          )),
      obscureText: _hidePassword,
    );
  }
}
