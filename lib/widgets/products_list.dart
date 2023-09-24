import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/global_variables.dart';
import 'package:flutter_shopping_app/pages/product_details_page.dart';
import 'product_cards.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List<String> filters = ['All', 'Nike', 'Adidas', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(119, 119, 119, 1),
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return Center(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: ((context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).primaryColor
                            : const Color.fromRGBO(245, 247, 249, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        label: Text(filter),
                        labelStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        side: const BorderSide(
                            color: Color.fromRGBO(245, 247, 249, 1)),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1080) {
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.75,
                    ),
                    itemBuilder: (context, index) {
                      final item = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductsDetailPage(product: item);
                          }));
                        },
                        child: ProductCard(
                          title: item['title'] as String,
                          price: item['price'] as double,
                          imageUrl: item['imageUrl'] as String,
                          bgColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: ((context, index) {
                      final item = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductsDetailPage(product: item);
                          }));
                        },
                        child: ProductCard(
                          title: item['title'] as String,
                          price: item['price'] as double,
                          imageUrl: item['imageUrl'] as String,
                          bgColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    }),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
