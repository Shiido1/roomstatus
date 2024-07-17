import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_profile_response_model.g.dart';

@JsonSerializable()
class GetProfileResponseModel {
  bool? success;
  String? message;
  Data? data;

  GetProfileResponseModel({this.success, this.message, this.data});

  factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetProfileResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetProfileResponseModelToJson(this);
}
