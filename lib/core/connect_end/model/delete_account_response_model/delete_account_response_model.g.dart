// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_account_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAccountResponseModel _$DeleteAccountResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteAccountResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$DeleteAccountResponseModelToJson(
        DeleteAccountResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
