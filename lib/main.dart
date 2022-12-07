import 'package:flutter/material.dart';
import 'package:trying_animations_with_flare_for_flutter/part1/flare_pt1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flare? Con que se come?',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const FlarePT1(),
    );
  }
}
