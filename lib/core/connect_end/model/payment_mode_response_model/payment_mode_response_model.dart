import 'package:json_annotation/json_annotation.dart';

part 'payment_mode_response_model.g.dart';

@JsonSerializable()
class PaymentModeResponseModel {
  bool? success;
  String? message;
  List<String>? data;

  PaymentModeResponseModel({this.success, this.message, this.data});

  factory PaymentModeResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PaymentModeResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentModeResponseModelToJson(this);
}
