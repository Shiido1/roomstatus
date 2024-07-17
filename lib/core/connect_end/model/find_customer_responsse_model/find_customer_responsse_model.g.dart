// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_customer_responsse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindCustomerResponsseModel _$FindCustomerResponsseModelFromJson(
        Map<String, dynamic> json) =>
    FindCustomerResponsseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FindCustomerResponsseModelToJson(
        FindCustomerResponsseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
