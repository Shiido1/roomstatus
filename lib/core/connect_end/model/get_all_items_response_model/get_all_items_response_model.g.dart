// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_items_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllItemsResponseModel _$GetAllItemsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllItemsResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllItemsResponseModelToJson(
        GetAllItemsResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };
