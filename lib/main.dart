import 'package:flutter/material.dart';

import 'On_Boarding/page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => SafeArea(child: child!),
      home:const PageViewOnBoarding(),
    );
  }
}
