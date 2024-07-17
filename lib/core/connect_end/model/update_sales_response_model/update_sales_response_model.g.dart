// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_sales_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSalesResponseModel _$UpdateSalesResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateSalesResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateSalesResponseModelToJson(
        UpdateSalesResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
