import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_rooms_response_model.g.dart';

@JsonSerializable()
class GetAllRoomsResponseModel {
  bool? success;
  String? message;
  Data? data;

  GetAllRoomsResponseModel({this.success, this.message, this.data});

  factory GetAllRoomsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllRoomsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllRoomsResponseModelToJson(this);
}
