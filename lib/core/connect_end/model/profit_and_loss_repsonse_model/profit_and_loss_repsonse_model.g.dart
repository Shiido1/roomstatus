// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_and_loss_repsonse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitAndLossRepsonseModel _$ProfitAndLossRepsonseModelFromJson(
        Map<String, dynamic> json) =>
    ProfitAndLossRepsonseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfitAndLossRepsonseModelToJson(
        ProfitAndLossRepsonseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
