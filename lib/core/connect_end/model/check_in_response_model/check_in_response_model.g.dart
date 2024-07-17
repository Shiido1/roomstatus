// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckInResponseModel _$CheckInResponseModelFromJson(
        Map<String, dynamic> json) =>
    CheckInResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckInResponseModelToJson(
        CheckInResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
