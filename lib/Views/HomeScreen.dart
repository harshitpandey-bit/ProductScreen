import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/ProductController.dart';

import 'ProductDetailsScreen.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              final product = productController.productList[index];
              return ListTile(
                onTap: () {
                  Get.to(() => ProductDetailsScreen(), arguments: product);
                },
                leading: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    product.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(product.title ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$${product.price.toString()}'),
                    Text('Rating: ${product.rating?.rate ?? 0} (${product.rating?.count ?? 0} reviews)'),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
