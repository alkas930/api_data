import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project1/formfeild.dart';
import 'package:project1/page.dart';
import 'package:project1/routes.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _MyLoginState();
}

class _MyLoginState extends State<signup> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Image.asset(
              "asets/sp.jpg",
              scale: 2,
            ),
          ),
          Column(
            children: [
              formfeild(
                hintText: "User Name",
                obscureText: false,
                labelText: "User Name",
              ),
            ],
          ),
          formfeild(
            hintText: "E Mail",
            obscureText: false,
            labelText: "E Mail",
          ),
          formfeild(
            hintText: "Password",
            obscureText: true,
            labelText: "Password",
          ),
          formfeild(
            hintText: "Confirm Password",
            obscureText: true,
            labelText: "Confirm Password",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: MaterialButton(
              height: 40,
              minWidth: double.infinity,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, ProductPageRoute);
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  String username = _usernameController.text;
                  String confirmPassword = _confirmPasswordController.text;
                  Navigator.pushNamed(context, ProductPageRoute);
                }
              },
              child: Text(
                'Sign In',
              ),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
