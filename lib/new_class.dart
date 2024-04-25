import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project1/posts_model.dart';

class NewClass extends StatelessWidget {
  final String title;
  final String description;
  final String ImagePath;

  const NewClass(
      {super.key,
      required this.title,
      required this.ImagePath,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New CLass'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
              ImagePath,
              scale: 2,
            ),
          ],
        ),
      ),
    );
  }
}