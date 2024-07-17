// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify_corporate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifyCorporateResponseModel _$NotifyCorporateResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotifyCorporateResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$NotifyCorporateResponseModelToJson(
        NotifyCorporateResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
