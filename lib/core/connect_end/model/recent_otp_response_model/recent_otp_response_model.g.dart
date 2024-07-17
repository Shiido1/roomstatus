// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentOtpResponseModel _$RecentOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    RecentOtpResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentOtpResponseModelToJson(
        RecentOtpResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
