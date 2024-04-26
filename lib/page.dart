import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/new_class.dart';
import 'package:project1/posts_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List product = [];

  Future<void> fetchProduct() async {
    try {
      final response =
          await http.get(Uri.parse("https://dummyjson.com/product"));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          product = (data['products'] as List<dynamic>)
              .map((item) => Product.fromJson(item))
              .toList();
        });
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
        ),
        body: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Text(product[index].title),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewClass(
                              description: product[index].description,
                              title: product[index].title,
                              brand: product[index].brand,
                              category: product[index].category,
                              discountPercentage:
                                  product[index].discountPercentage.toString(),
                              price: product[index].price.toString(),
                              rating: product[index].rating.toString(),
                              stock: product[index].stock.toString(),
                              ImagePath: "https://picsum.photos/id/1/200/300",
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.network("https://picsum.photos/id/1/200/300"),
                      ))
                ],
              ),
            );
          },
        ));
  }
}
