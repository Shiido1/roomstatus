// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_sales_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllSalesResponseModel _$GetAllSalesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllSalesResponseModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllSalesResponseModelToJson(
        GetAllSalesResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };
