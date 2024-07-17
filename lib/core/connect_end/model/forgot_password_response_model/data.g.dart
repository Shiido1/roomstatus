// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      currentRole: json['current_role'] as String?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      department: json['department'],
      hotel: json['hotel'] as String?,
      hotelCode: json['hotel_code'] as String?,
      hotelHasVat: (json['hotel_has_vat'] as num?)?.toInt(),
      hotelLogo: json['hotel_logo'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
      'current_role': instance.currentRole,
      'username': instance.username,
      'image': instance.image,
      'department': instance.department,
      'hotel': instance.hotel,
      'hotel_code': instance.hotelCode,
      'hotel_has_vat': instance.hotelHasVat,
      'hotel_logo': instance.hotelLogo,
    };
