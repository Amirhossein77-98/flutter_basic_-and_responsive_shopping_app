import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/pages/cart_page.dart';
import 'package:flutter_shopping_app/widgets/products_list.dart';

class MyShoppingAppHomePage extends StatefulWidget {
  const MyShoppingAppHomePage({super.key});

  @override
  State<MyShoppingAppHomePage> createState() => _MyShoppingAppHomePageState();
}

class _MyShoppingAppHomePageState extends State<MyShoppingAppHomePage> {
  int currentPage = 0;
  List<Widget> pages = const [ProductsList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
