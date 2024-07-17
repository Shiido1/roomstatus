import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  int? id;
  @JsonKey(name: 'transaction date')
  String? transactionDate;
  @JsonKey(name: 'amount_paid')
  int? amountPaid;
  dynamic due;
  int? net;

  Payment({
    this.id,
    this.transactionDate,
    this.amountPaid,
    this.due,
    this.net,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return _$PaymentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
