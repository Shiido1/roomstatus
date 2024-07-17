// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String?,
      address: json['address'] as String?,
      cityId: json['city_id'] as String?,
      logo: json['logo'] as String?,
      telephone: json['telephone'] as String?,
      email: json['email'] as String?,
      code: json['code'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: (json['id'] as num?)?.toInt(),
      renew: json['renew'] == null
          ? null
          : DateTime.parse(json['renew'] as String),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'city_id': instance.cityId,
      'logo': instance.logo,
      'telephone': instance.telephone,
      'email': instance.email,
      'code': instance.code,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'renew': instance.renew?.toIso8601String(),
    };
