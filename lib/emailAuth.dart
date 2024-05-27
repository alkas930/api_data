import 'package:flutter/material.dart';

class emailAuth extends StatefulWidget {
  const emailAuth({super.key});

  @override
  State<emailAuth> createState() => _emailAuthState();
}

class _emailAuthState extends State<emailAuth> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email auth"),
      ),
      body: Column(
        children: [TextField()],
      ),
    );
  }
}
