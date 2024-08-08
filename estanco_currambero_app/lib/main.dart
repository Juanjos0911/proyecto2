import 'package:flutter/material.dart';

import 'widgets/logginpage.dart';

void main() {
  runApp(MyApp());
}

  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estanco Currambero',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}