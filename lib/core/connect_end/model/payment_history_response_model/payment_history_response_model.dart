import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'payment_history_response_model.g.dart';

@JsonSerializable()
class PaymentHistoryResponseModel {
  bool? success;
  String? message;
  Data? data;

  PaymentHistoryResponseModel({this.success, this.message, this.data});

  factory PaymentHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PaymentHistoryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentHistoryResponseModelToJson(this);
}
