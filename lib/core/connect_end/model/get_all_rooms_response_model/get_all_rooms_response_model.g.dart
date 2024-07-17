// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_rooms_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllRoomsResponseModel _$GetAllRoomsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllRoomsResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllRoomsResponseModelToJson(
        GetAllRoomsResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
