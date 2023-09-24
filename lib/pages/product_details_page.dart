import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductsDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductsDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductsDetailPage> createState() => _ProductsDetailPageState();
}

class _ProductsDetailPageState extends State<ProductsDetailPage> {
  int selectedSize = 0;

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'size': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added to cart successfully!')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please Select a size!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'],
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.product['imageUrl'],
              height: 250,
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Color.fromRGBO(245, 247, 249, 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price'].toString()}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        fixedSize: const Size(350, 50)),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
