import 'package:flutter/material.dart';
import 'package:project1/posts_model.dart';
// import 'package:project1/product.dart'; // Assuming this is where your Product class is defined

class CartScreen extends StatelessWidget {
  final List<Product> cartProducts;

  const CartScreen({Key? key, required this.cartProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final product = cartProducts[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Image.network(
                product.thumbnail ?? '',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(product.title ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${product.price.toString()}'),
                  Text('Quantity: 1'), // Assuming quantity is fixed for now
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Implement your logic to remove product from cart
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${calculateTotal(cartProducts)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement your checkout logic here
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String calculateTotal(List<Product> products) {
    double total = 0;
    for (var product in products) {
      total += product.price ?? 0;
    }
    return total.toStringAsFixed(2);
  }
}
