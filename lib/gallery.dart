import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled/dataSoure/cardData.dart';
import 'package:untitled/unit.dart';

import 'model/Card.dart' as CardModel;

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  final bool isLoadMore = true;
  final bool _hasMore = true;
  // 是否添加头部 默认不添加 头部逻辑目前没有添加 TODO
  final bool isHaveHeader = true;
  // 是否支持下拉刷新 默认可以下拉刷新
  final bool isCanRefresh = true;
  // 是否支持上拉加载更多 默认可以加载更多
  final bool isCanLoadMore = true;

  static const loadingTag = "##loading##"; //表尾标记
  //每次获取数据的数量
  int num = 5;
  //存储获取的模型对象
  List<CardModel.Card> _cards = [];
  //随机对象
  var ran = Random();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 添加列表表尾标记
    _cards.add(CardModel.Card(' ', loadingTag, 0));
    getCards();
  }

  @override
  Widget build(BuildContext context) {
    // print(_cards.elementAt(1));
    // return StaggeredGridView.builder(
    //     gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, staggeredTileBuilder: (int index) { return StaggeredTile.fit(1); }),
    //     itemBuilder: (context, index){
    //             return const UnitStock(
    //               image: 'images/anime/1.jpg',
    //               countryIndex: 0,
    //               title: 'dataaaaaaaaaaaaaaaaaadataaaaaaaaaaaaaaaaaadataaaaaaaaaaaaaaaaaa',
    //             );
    //           },
    // );

  }

  Widget card(BuildContext context, int index){
    return const UnitStock(
      image: 'images/anime/1.jpg',
      countryIndex: 0,
      title: "",
    );
  }

  Widget _buildGridWidget(){
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      itemCount: _cards.length,
      itemBuilder: (context, index){
        //
        if(_cards[index].title == loadingTag){
          if(_cards.length < 100) {
            getCards();

            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const Text('没有更多了'),
            );
          }
        }

        return UnitStock(
          image: _cards[index].image,
          countryIndex: _cards[index].country,
          title: _cards[index].title,
        );
      },
      staggeredTileBuilder: (index){
        return const StaggeredTile.fit(1);
      },
    );
  }
  //获取模型数据
  void getCards(){
    var data;
    Future.delayed(const Duration(seconds: 5)).then((e) => {
      setState(() {
      for(int i = 0; i < num; i++) {
        // 从数据库中随机获取一条数据
        data = CardData.cardData[ran.nextInt(CardData.cardData.length)];
        // json字符串解码，生成模型对象
        _cards.insert(_cards.length - 1, _fromJson(data));
      }
      })
    });


    print(_cards.length);
  }

  CardModel.Card _fromJson(Map<String, dynamic> json){
    return CardModel.Card.fromJson(json);
  }

  // 上拉加载更多
  Widget _buildProgressIndicator(){
    return _hasMore
        ? Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitFadingCircle(color: Theme.of(context).primaryColor),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('正在加载...',style: TextStyle(color: Colors.black54, fontSize: 15)),
                  ),
                ],
              ),
            ),
          ) : Container(
            padding: const EdgeInsets.all(15),
            child: const Center(
              child: Text('真没了！！',style: TextStyle(color: Colors.black54, fontSize: 15),)
            ),
          );
  }

  // 下拉刷新 加载动画
  Widget _buildIsLoading(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.85,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitCircle(
                  size: 55,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                  '正在加载...',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPage(){
    List<Widget> list = [];
    list.add(
        Expanded(child: isCanRefresh ?
            RefreshIndicator(
              onRefresh: _handleRefresh,
              color: Theme.of(context).primaryColor,
              child: _buildGridWidget(),
        ) : _buildGridWidget(),
        ));
    if(isCanLoadMore){
      list.add(
        // 是否支持 加载更多
        Offstage(offstage: !isLoadMore, child: _buildProgressIndicator()),
      );
    }
    return Column(
      children: list,
    );
  }
  Future _handleRefresh() async{
    await Future.delayed(const Duration(seconds: 3),(){
      return null;
    });
    // Dio dio = Dio();
    // await dio.get('http://www.baidu.com',options: Options(responseType: ResponseType.plain));
  }
}
