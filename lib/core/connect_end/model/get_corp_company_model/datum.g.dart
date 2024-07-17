// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      status: json['status'],
      creditLimit: (json['credit limit'] as num?)?.toInt(),
      amountOweing: json['amount oweing'],
      city: json['city'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'status': instance.status,
      'credit limit': instance.creditLimit,
      'amount oweing': instance.amountOweing,
      'city': instance.city,
    };
