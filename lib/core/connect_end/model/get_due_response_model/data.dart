import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'Room Rate')
  int? roomRate;
  @JsonKey(name: 'Day(s)')
  int? dayS;
  @JsonKey(name: 'Total amount')
  int? totalAmount;
  @JsonKey(name: 'discount price')
  int? discountPrice;
  @JsonKey(name: 'VAT')
  String? vat;
  @JsonKey(name: 'Total Due')
  int? totalDue;

  Data({
    this.roomRate,
    this.dayS,
    this.totalAmount,
    this.discountPrice,
    this.vat,
    this.totalDue,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
