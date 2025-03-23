import 'package:flutter/material.dart';
import 'package:shop/controller/theme_controller.dart';
import 'package:shop/view/login_screen.dart';

void main() {
  runApp(
    const Shop(),
  );
}

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeController().lightTheme(),
      home: LoginScreen(),
    );
  }
}
