import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:untitled/unit.dart';

import 'drawerPage/mainPage.dart';
import 'gallery.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int _elementIndex = 0;
  String routeName = '';
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOption = <Widget>[
    Gallery(),
    Text('Index 1: Home', style: optionStyle),
    MainPage()];
  void _onItemTapped(int index){
    setState(() {
      _elementIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold"),
        //导航栏左侧菜单自定义图标
        // leading: Builder(builder: (context){
        //   return IconButton(
        //     icon: Icon(Icons.dashboard),
        //     onPressed: (){
        //       Scaffold.of(context).openDrawer();
        //     },
        //   );
        // }),
      ),
      drawer: _myDrawer(),
      body: _widgetOption.elementAt(_elementIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "商品"),
          BottomNavigationBarItem(icon: Icon(Icons.alarm_on), label: "会员"),
        ],
        currentIndex: _elementIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _myDrawer(){
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: false,
        child: Container(
          alignment: Alignment.topLeft,
          child: ListView(
            children: [
              TextButton(
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.only(left: 10, right: 30), child: Icon(Icons.water_damage,color: Colors.black54,),),
                    Text("主页", style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  ],
                ),
                onPressed: (){
                  Navigator.pushNamed(context, 'mainPage');
                },
              ),
              TextButton(
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.only(left: 10, right: 30), child: Icon(Icons.water_damage,color: Colors.black54,),),
                    Text("最近", style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  ],
                ),
                onPressed: (){
                  Navigator.pushNamed(context, 'recent');

                },
              ),
              TextButton(
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.only(left: 10, right: 30), child: Icon(Icons.water_damage,color: Colors.black54,),),
                    Text("已收藏的书", style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  ],
                ),
                onPressed: (){

                },
              ),
              TextButton(
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.only(left: 10, right: 30), child: Icon(Icons.water_damage,color: Colors.black54,),),
                    Text("已下载", style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  ],
                ),
                onPressed: (){
                  Navigator.pushNamed(context, 'downloaded');

                },
              ),
              TextButton(
                child: Row(
                  children: const [
                    Padding(padding: EdgeInsets.only(left: 10, right: 30), child: Icon(Icons.water_damage,color: Colors.black54,),),
                    Text("已收藏的分类", style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  ],
                ),
                onPressed: (){
                  Navigator.pushNamed(context, 'collectedBooks');
                },
              ),

            ],
          ),
        )

      ),
    );
  }
}
