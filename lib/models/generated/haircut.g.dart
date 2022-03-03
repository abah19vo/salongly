// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../haircut.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Haircut _$HaircutFromJson(Map<String, dynamic> json) => Haircut(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imgUrl: json['imgUrl'] as String? ?? '',
    );

Map<String, dynamic> _$HaircutToJson(Haircut instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
    };
