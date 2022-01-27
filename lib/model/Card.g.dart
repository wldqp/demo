// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      json['image'] as String,
      json['title'] as String,
      json['country'] as int,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'country': instance.country,
    };
