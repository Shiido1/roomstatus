// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBookingResponseModel _$AddBookingResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddBookingResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddBookingResponseModelToJson(
        AddBookingResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
