// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'dart:html';

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:english_words/english_words.dart";
import 'package:flutter/services.dart';
import 'package:untitled/drawerPage/collectedBooks.dart';
import 'package:untitled/drawerPage/recentPage.dart';

import 'package:untitled/loginPage.dart';
import 'package:untitled/appNavigationBar.dart';

import 'drawerPage/downloaded.dart';
import 'drawerPage/mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var _off = false;
  Map<String, WidgetBuilder> route = {
    '/': (context) => AppNavigationBar(),
    'mainPage': (context) => MainPage(),
    'Recent': (context) => Recent(),
    'downloaded': (context) => Downloaded(),
    'collectedBooks': (context) => CollectedBooks(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      initialRoute: '/',
      theme: new ThemeData(
        primaryColor: Colors.black
      ),
      routes: route,
    );
  }

  void a(Test t,{String? s}){
    t.setValue();
    t.getValue();
  }
}

class Test{
  String s = "c";
  void setValue(){
    s = "1";
  }
  void getValue(){
    print(s);
  }
}
