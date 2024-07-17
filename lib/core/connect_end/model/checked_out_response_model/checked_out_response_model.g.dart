// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checked_out_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckedOutResponseModel _$CheckedOutResponseModelFromJson(
        Map<String, dynamic> json) =>
    CheckedOutResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckedOutResponseModelToJson(
        CheckedOutResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
