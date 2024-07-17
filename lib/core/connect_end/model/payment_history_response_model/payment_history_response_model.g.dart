// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentHistoryResponseModel _$PaymentHistoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaymentHistoryResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentHistoryResponseModelToJson(
        PaymentHistoryResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
