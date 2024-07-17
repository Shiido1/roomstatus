// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_sales_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportSalesResponseModel _$ReportSalesResponseModelFromJson(
        Map<String, dynamic> json) =>
    ReportSalesResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportSalesResponseModelToJson(
        ReportSalesResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
