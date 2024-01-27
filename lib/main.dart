import 'package:flutter/material.dart';
import 'screen/loginPage.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyComc',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
