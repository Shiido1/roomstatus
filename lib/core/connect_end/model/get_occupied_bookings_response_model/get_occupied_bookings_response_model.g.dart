// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_occupied_bookings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOccupiedBookingsResponseModel _$GetOccupiedBookingsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetOccupiedBookingsResponseModel(
      id: (json['id'] as num?)?.toInt(),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$GetOccupiedBookingsResponseModelToJson(
        GetOccupiedBookingsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'details': instance.details,
    };
