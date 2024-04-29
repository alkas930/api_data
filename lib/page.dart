import 'dart:convert';

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/icons.dart';
import 'package:project1/new_class.dart';
import 'package:project1/posts_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List product = [];

  fetchProduct() async {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 42, 44, 158),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Limited Time Deals',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.punch_clock,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "offer ends soon",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_right),
            )
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: product.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 245, 248, 249),
                border: Border.all(color: Colors.grey)),
            height: size.height,
            width: size.width,
            child: Column(
              children: [
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://picsum.photos/id/1/200/300",
                        fit: BoxFit.contain,
                        scale: 2.3,
                      ),
                    ),
                  ),
                ),
                Text(
                  product[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Buds T300 with .....",
                  style: TextStyle(
                      color: Color.fromARGB(255, 18, 18, 18), fontSize: 13),
                ),
                AnimatedRatingStars(
                    onChanged: (v) {},
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Price  ",
                      style: TextStyle(color: Color.fromARGB(255, 13, 225, 24)),
                    ),
                    Text(
                      product[index].price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
