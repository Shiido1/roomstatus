// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_booking_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBookingHistory _$GetAllBookingHistoryFromJson(
        Map<String, dynamic> json) =>
    GetAllBookingHistory(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllBookingHistoryToJson(
        GetAllBookingHistory instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
