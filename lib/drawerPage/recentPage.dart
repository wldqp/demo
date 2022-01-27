
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  String barName = '最近';
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
