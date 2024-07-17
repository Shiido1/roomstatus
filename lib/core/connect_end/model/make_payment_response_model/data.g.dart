// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      status: json['status'],
      creditLimit: (json['credit limit'] as num?)?.toInt(),
      amountOweing: (json['amount oweing'] as num?)?.toInt(),
      city: json['city'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'status': instance.status,
      'credit limit': instance.creditLimit,
      'amount oweing': instance.amountOweing,
      'city': instance.city,
    };
