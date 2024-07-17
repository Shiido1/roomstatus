// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakePaymentResponseModel _$MakePaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    MakePaymentResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MakePaymentResponseModelToJson(
        MakePaymentResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
