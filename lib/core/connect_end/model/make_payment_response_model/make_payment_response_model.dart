import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'make_payment_response_model.g.dart';

@JsonSerializable()
class MakePaymentResponseModel {
  bool? success;
  String? message;
  Data? data;

  MakePaymentResponseModel({this.success, this.message, this.data});

  factory MakePaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return _$MakePaymentResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MakePaymentResponseModelToJson(this);
}
