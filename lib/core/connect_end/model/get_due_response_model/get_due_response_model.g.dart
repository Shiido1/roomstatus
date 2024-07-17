// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_due_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDueResponseModel _$GetDueResponseModelFromJson(Map<String, dynamic> json) =>
    GetDueResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDueResponseModelToJson(
        GetDueResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
