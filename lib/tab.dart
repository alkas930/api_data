import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:project1/mobiles.dart';
import 'package:project1/page.dart';
import 'package:project1/page2.dart';

class tab extends StatefulWidget {
  const tab({super.key});

  @override
  State<tab> createState() => _tabState();
}

class _tabState extends State<tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Color.fromARGB(255, 243, 243, 241),
        child: ContainedTabBarView(
          tabs: [
            Text(
              'laptops',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text('mobiles',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
          views: [
            ProductPage(),
            ProductPage2(),
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
