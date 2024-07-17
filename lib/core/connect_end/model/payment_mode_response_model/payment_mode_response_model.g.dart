// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_mode_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModeResponseModel _$PaymentModeResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaymentModeResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PaymentModeResponseModelToJson(
        PaymentModeResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
