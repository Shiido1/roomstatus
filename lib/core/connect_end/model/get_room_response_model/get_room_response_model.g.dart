// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_room_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoomResponseModel _$GetRoomResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetRoomResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRoomResponseModelToJson(
        GetRoomResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
