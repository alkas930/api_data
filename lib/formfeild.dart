import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class formfeild extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final String labelText;

  formfeild(
      {required this.hintText,
      required this.obscureText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText,
          enabledBorder: OutlineInputBorder(),
          fillColor: Colors.grey,
        ),
      ),
    );
  }
}
