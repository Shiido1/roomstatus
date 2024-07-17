import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'find_customer_responsse_model.g.dart';

@JsonSerializable()
class FindCustomerResponsseModel {
  bool? success;
  String? message;
  Data? data;

  FindCustomerResponsseModel({this.success, this.message, this.data});

  factory FindCustomerResponsseModel.fromJson(Map<String, dynamic> json) {
    return _$FindCustomerResponsseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FindCustomerResponsseModelToJson(this);
}
