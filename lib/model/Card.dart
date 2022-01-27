
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

// part 'Card.g.dart';

// @JsonSerializable()
class Card{
  static String prefix = 'images/anime/';
  static String format = '.jpg';
  static Random ran = Random();
  // @JsonKey(name: 'image')
  late String image;
  // @JsonKey(name: 'title')
  late String title;
  // @JsonKey(name: 'country')
  late int country;

  Card(this.image, this.title, this.country);

  // factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  // Map<String, dynamic> toJson() => _$CardToJson(this);
  Card.fromJson(Map<String, dynamic> json){
    image = prefix + (ran.nextInt(14).toString()) + format;
    title = json['title'];
    country = json['countryIndex'];
  }

  Map<String, dynamic> toJson(){
    return {
      'image' : image,
      'title' : title,
      'countryIndex' : country
    };
  }
}