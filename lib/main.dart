import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/cart_provider.dart';
import 'package:flutter_shopping_app/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          title: 'Shopping App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(254, 206, 1, 1),
                primary: const Color.fromRGBO(254, 206, 1, 1),
              ),
              primaryColor: const Color.fromRGBO(254, 206, 1, 1),
              useMaterial3: true,
              textTheme: const TextTheme(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                ),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                bodySmall: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  prefixIconColor: Color.fromRGBO(119, 119, 119, 1))),
          home: const MyShoppingAppHomePage()),
    );
  }
}
