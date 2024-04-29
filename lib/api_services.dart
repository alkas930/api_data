import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  ButtonsTabBar(
                    backgroundColor: Colors.brown,
                    unselectedBackgroundColor: Colors.grey,
                    unselectedLabelStyle: TextStyle(color: Colors.lime),
                    labelStyle: TextStyle(color: Colors.pink),
                    tabs: [
                      Tab(
                        icon: Icon(Icons.laptop),
                        text: "laptop",
                      ),
                      Tab(
                        icon: Icon(Icons.laptop),
                        text: "laptop",
                      ),
                      Tab(
                        icon: Icon(Icons.laptop),
                        text: "laptop",
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
