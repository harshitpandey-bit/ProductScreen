import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/Product.dart';


class ProductDetailsScreen extends StatelessWidget {
  final Product product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? 'Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image ?? '',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$${product.price.toString()}',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Text(
                        '${product.rating?.rate} (${product.rating?.count} reviews)',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    product.description ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            buildBuyNowAndCartButtons(),
            buildTabSection(),
          ],
        ),
      ),
    );
  }

  Widget buildBuyNowAndCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(150, 45),
            ),
            child: Text(
              'Buy Now',
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(150, 45),
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabSection() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Reviews'),
            ],
            labelColor: Colors.black,
            indicatorColor: Colors.orange,
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Product details and specifications go here.'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Customer reviews will be displayed here.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
