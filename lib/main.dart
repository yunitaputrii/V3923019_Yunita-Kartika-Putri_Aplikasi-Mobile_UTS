import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';


void main() {
  runApp( const ECommerceApp());
}


class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        
      },
    );
  }
}