// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      cityId: json['city_id'],
      stateId: json['state_id'],
      countryId: json['country_id'],
      businessId: json['business_id'],
      idType: json['id_type'] as String?,
      idNumber: json['id_number'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'city_id': instance.cityId,
      'state_id': instance.stateId,
      'country_id': instance.countryId,
      'business_id': instance.businessId,
      'id_type': instance.idType,
      'id_number': instance.idNumber,
    };
