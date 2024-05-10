import 'package:flutter/material.dart';
import 'package:project1/page.dart';
import 'package:project1/routes.dart';
import 'package:project1/signup.dart';
import 'package:url_launcher/url_launcher.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "asets/sp.jpg",
                scale: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Validation passed, handle login
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        // Add your login logic here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductPage(),
                          ),
                        );
                      }
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: const Text('Sign In'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Validation passed, handle login
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        // Add your login logic here
                        // Navigator.pushNamed(context, signupRoute);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const signup(),
                          ),
                        );
                      }
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: const Text('Sign Up'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Forgot Password ?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Sign in with Social network",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // Add your Facebook login logic here
                  },
                  icon: Container(
                    child: const Icon(
                      Icons.facebook,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add your Google login logic here
                  },
                  icon: const Icon(
                    Icons.email,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse("https://wa.me/+918930307692"));
                  },
                  child: Image.asset(
                    "asets/3536445.png",
                    scale: 8,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
