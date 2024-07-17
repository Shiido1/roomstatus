import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'check_in_response_model.g.dart';

@JsonSerializable()
class CheckInResponseModel {
  bool? success;
  String? message;
  Data? data;

  CheckInResponseModel({this.success, this.message, this.data});

  factory CheckInResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CheckInResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckInResponseModelToJson(this);
}
