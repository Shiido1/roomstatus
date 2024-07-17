import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_due_response_model.g.dart';

@JsonSerializable()
class GetDueResponseModel {
  bool? success;
  String? message;
  Data? data;

  GetDueResponseModel({this.success, this.message, this.data});

  factory GetDueResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetDueResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDueResponseModelToJson(this);
}
