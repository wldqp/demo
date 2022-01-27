
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

const List<String> countryIcons = [
  'icons/flags/png/cn.png',
  'icons/flags/png/us.png',
  'icons/flags/png/jp.png',
];

class UnitStock extends StatelessWidget{


  //widget在水平线所占宽度比例
  static const double widthScale = 0.4;
  //需要展示的图片
  final String image;
  //文字介绍
  final String title;
  //对应国家国旗索引
  final int countryIndex;
  final double radiusNum = 3;
  const UnitStock({
    required this.image,
    required this.title,
    required this.countryIndex,
  });

  @override
  Widget build(BuildContext context) {
    print(window.physicalSize);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(radiusNum)),
        boxShadow: const [
          BoxShadow(
              color:Colors.black54,
              offset: Offset(0.0,0.0),
              blurRadius: 2.0
          )
        ],
      ),
      constraints: const BoxConstraints.tightFor(width: 150),
      child: Column(
        //必须加这句，否则container组件的大小会占满屏幕
        mainAxisSize: MainAxisSize.min,
        children: [
          //ClipRRect这个组件是给图片设置圆角的
           ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radiusNum),topRight: Radius.circular(radiusNum)),
            child: Image(
              // 橱窗图片
              image: AssetImage(image),
              height: 200,
              fit: BoxFit.fitHeight,
            )
          ),

          Padding(
            padding: EdgeInsets.only(top: 8),
            child: RichText(
              textWidthBasis: TextWidthBasis.longestLine,
              text: TextSpan(
                  text: ' ',
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                  ),
                  children: [
                    // 国旗图标展示
                    WidgetSpan(
                      child: Image.asset(countryIcons[countryIndex],
                          package: 'country_icons',
                        width: 25,
                        height: 25,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    //标题部分
                    TextSpan(text: title),
                  ]
              ),
            ),
          )
        ],
      ),
    );
  }
}