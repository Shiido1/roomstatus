import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'checked_out_response_model.g.dart';

@JsonSerializable()
class CheckedOutResponseModel {
  bool? success;
  String? message;
  Data? data;

  CheckedOutResponseModel({this.success, this.message, this.data});

  factory CheckedOutResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CheckedOutResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckedOutResponseModelToJson(this);
}
