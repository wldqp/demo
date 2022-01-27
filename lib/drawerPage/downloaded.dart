
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Downloaded extends StatefulWidget {
  const Downloaded({Key? key}) : super(key: key);

  @override
  _DownloadedState createState() => _DownloadedState();
}

class _DownloadedState extends State<Downloaded> {
  String downloadPageName = '已下载';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(downloadPageName),
      ),
      body: Text(downloadPageName),
    );
  }
}
