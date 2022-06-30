// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haircut.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Haircut _$HaircutFromJson(Map<String, dynamic> json) => Haircut(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imgUrl: json['imgUrl'] as String? ?? '',
      rating: json['rating'] as int? ?? 0,
      price: json['price'] as int? ?? -1,
      type: $enumDecodeNullable(_$HaircutTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$HaircutToJson(Haircut instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
      'rating': instance.rating,
      'price': instance.price,
      'type': _$HaircutTypeEnumMap[instance.type],
    };

const _$HaircutTypeEnumMap = {
  HaircutType.child: 'child',
  HaircutType.women: 'women',
  HaircutType.man: 'man',
};
