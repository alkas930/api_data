import 'dart:ui';

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
        actions: [
          Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.shopping_cart,
                color: Colors.purple,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    ImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(title,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 10,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22, top: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        brand,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.favorite_border),
                              Text("Wishlist")
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Icon(
                                Icons.share,
                                color: Colors.blue,
                              ),
                              Text("share")
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 10,
                  ),
                ),
                Row(
                  children: [
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
                          color: Color.fromARGB(192, 220, 103, 7),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    SizedBox(width: 5),
                    Text(
                      stock,
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(" ratings", style: TextStyle(color: Colors.blue))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money_sharp,
                      color: Colors.green,
                    ),
                    Text(
                      price,
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      " with 2 Special offers",
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.fire_truck),
                          backgroundColor: Colors.teal,
                        ),
                        Text(
                          "  Free\nDelivery",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.find_replace,
                          ),
                          backgroundColor: Colors.teal,
                        ),
                        Text(
                          " 10 days\nReplacement",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.wallet_membership),
                          backgroundColor: Colors.teal,
                        ),
                        Text(
                          " 36 Month\nwarranty",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.purple,
                        ),
                        Text("Add to cart"),
                      ],
                    )),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_circle_right_rounded,
                          color: Colors.purple,
                        ),
                        Text("Buy Now"),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
