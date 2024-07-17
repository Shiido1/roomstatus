// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBookingResponseModel _$UpdateBookingResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateBookingResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateBookingResponseModelToJson(
        UpdateBookingResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
