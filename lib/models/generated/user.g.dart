// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      haircutsHistoryIds: (json['haircutsHistoryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.client,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'userType': _$UserTypeEnumMap[instance.userType],
      'haircutsHistoryIds': instance.haircutsHistoryIds,
    };

const _$UserTypeEnumMap = {
  UserType.admin: 'admin',
  UserType.client: 'client',
};
