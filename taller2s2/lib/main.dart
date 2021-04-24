import 'package:flutter/material.dart';
import 'package:taller2s2/page/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion de Taller 2S2',
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}
