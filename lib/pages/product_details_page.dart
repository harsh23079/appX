import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Image Slider ---
            SizedBox(
              height: 600,
              child: PageView(
                children: product.images
                    .map((img) => Image.network(img, fit: BoxFit.cover))
                    .toList(),
              ),
            ),

            SizedBox(height: 20),

            Text(
              product.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "₹${product.price}",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),

            SizedBox(height: 20),

            Text(
              "Category: ${product.category.name}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 20),

            Text(
              "Description: ${product.description}",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
