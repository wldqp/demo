
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectedBooks extends StatefulWidget {
  const CollectedBooks({Key? key}) : super(key: key);

  @override
  _CollectedBooksState createState() => _CollectedBooksState();
}

class _CollectedBooksState extends State<CollectedBooks> {
  String barName = '收藏的书';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(barName),
      ),
      body: Text(barName),
    );
  }
}
