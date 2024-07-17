// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_status_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStatusResponseModel _$GetStatusResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetStatusResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStatusResponseModelToJson(
        GetStatusResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
