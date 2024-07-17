import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_status_response_model.g.dart';

@JsonSerializable()
class GetStatusResponseModel {
  bool? success;
  String? message;
  Data? data;

  GetStatusResponseModel({this.success, this.message, this.data});

  factory GetStatusResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetStatusResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetStatusResponseModelToJson(this);
}
