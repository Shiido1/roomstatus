// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      checkedIn: json['checked_in'] as String?,
      checkedOut: json['checked_out'] as String?,
      room: json['Room'] as String?,
      customer: json['customer'] as String?,
      phone: json['phone'] as String?,
      idType: json['id_type'] as String?,
      idNumber: json['id_number'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'checked_in': instance.checkedIn,
      'checked_out': instance.checkedOut,
      'Room': instance.room,
      'customer': instance.customer,
      'phone': instance.phone,
      'id_type': instance.idType,
      'id_number': instance.idNumber,
    };
