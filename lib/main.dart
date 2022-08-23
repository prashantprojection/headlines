import 'package:flutter/material.dart';
import 'package:news/ui/screens/dashboard.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}
