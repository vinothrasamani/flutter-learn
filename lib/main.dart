import 'package:flutter/material.dart';
import 'package:shop/view/home_screen.dart';

void main() {
  runApp(
    const Shop(),
  );
}

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Colors.blue;

    return MaterialApp(
      title: 'The Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: baseColor),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
