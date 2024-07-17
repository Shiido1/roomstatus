import 'package:json_annotation/json_annotation.dart';

import 'payment.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Payment>? payments;
  @JsonKey(name: 'Total Amount Owed')
  int? totalAmountOwed;
  @JsonKey(name: 'Total Amount Received')
  int? totalAmountReceived;
  @JsonKey(name: 'Balance/Net')
  int? balanceNet;

  Data({
    this.payments,
    this.totalAmountOwed,
    this.totalAmountReceived,
    this.balanceNet,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
