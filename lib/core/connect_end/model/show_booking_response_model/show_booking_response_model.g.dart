// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowBookingResponseModel _$ShowBookingResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShowBookingResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowBookingResponseModelToJson(
        ShowBookingResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
