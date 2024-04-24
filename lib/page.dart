import 'package:flutter/material.dart';
import 'package:project1/api_services.dart';
import 'package:project1/posts_model.dart';

class pageapi extends StatefulWidget {
  const pageapi({Key? key}) : super(key: key);
  @override
  State<pageapi> createState() => _pageapiState();
}

class _pageapiState extends State<pageapi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: const Center(child: Text("fetch data from api")),
      ),
      body: FutureBuilder(
        future: getposts(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Product> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(
                        products[index].thumbnail,
                        width: 100,
                      ),
                      title: Text(products[index].title),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
