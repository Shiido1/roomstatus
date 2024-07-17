// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteBookingResponseModel _$DeleteBookingResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteBookingResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$DeleteBookingResponseModelToJson(
        DeleteBookingResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
