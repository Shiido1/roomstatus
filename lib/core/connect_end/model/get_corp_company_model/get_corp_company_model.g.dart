// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_corp_company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCorpCompanyModel _$GetCorpCompanyModelFromJson(Map<String, dynamic> json) =>
    GetCorpCompanyModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCorpCompanyModelToJson(
        GetCorpCompanyModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
