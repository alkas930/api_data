import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project1/posts_model.dart';

class NewClass extends StatelessWidget {
  final String title;
  final String description;
  final String ImagePath;
  final String price;
  final String discountPercentage;
  final String rating;
  final String stock;
  final String brand;
  final String category;

  const NewClass(
      {super.key,
      required this.title,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
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
            Text(title),
            Image.network(
              ImagePath,
            ),
            Text(description),
            Text(brand),
            Text(category),
            Text(discountPercentage),
            Container(
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    rating,
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(192, 8, 245, 48),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Row(
              children: [
                Text("with special offer "),
                Text(price),
              ],
            ),
            Text(stock),
          ],
        ),
      ),
    );
  }
}
