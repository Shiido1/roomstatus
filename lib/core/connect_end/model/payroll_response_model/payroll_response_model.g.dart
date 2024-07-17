// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payroll_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayrollResponseModel _$PayrollResponseModelFromJson(
        Map<String, dynamic> json) =>
    PayrollResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$PayrollResponseModelToJson(
        PayrollResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
