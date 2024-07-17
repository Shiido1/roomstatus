// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_bookings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBookingsResponseModel _$GetAllBookingsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllBookingsResponseModel(
      bookings: (json['bookings'] as List<dynamic>?)
          ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBookingsResponseModelToJson(
        GetAllBookingsResponseModel instance) =>
    <String, dynamic>{
      'bookings': instance.bookings,
    };
