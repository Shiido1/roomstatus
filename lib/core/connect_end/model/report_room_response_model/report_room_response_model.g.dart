// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_room_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportRoomResponseModel _$ReportRoomResponseModelFromJson(
        Map<String, dynamic> json) =>
    ReportRoomResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportRoomResponseModelToJson(
        ReportRoomResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
