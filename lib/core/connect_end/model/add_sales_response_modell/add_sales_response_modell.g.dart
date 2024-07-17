// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_sales_response_modell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSalesResponseModell _$AddSalesResponseModellFromJson(
        Map<String, dynamic> json) =>
    AddSalesResponseModell(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddSalesResponseModellToJson(
        AddSalesResponseModell instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
