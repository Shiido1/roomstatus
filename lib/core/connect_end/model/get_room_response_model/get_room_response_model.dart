import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_room_response_model.g.dart';

@JsonSerializable()
class GetRoomResponseModel {
  bool? success;
  String? message;
  Data? data;

  GetRoomResponseModel({this.success, this.message, this.data});

  factory GetRoomResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetRoomResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetRoomResponseModelToJson(this);
}
