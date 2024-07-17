// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemsCategoryResponseModel _$GetItemsCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetItemsCategoryResponseModel(
      id: (json['id'] as num?)?.toInt(),
      source: json['source'] as String?,
    );

Map<String, dynamic> _$GetItemsCategoryResponseModelToJson(
        GetItemsCategoryResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
    };
