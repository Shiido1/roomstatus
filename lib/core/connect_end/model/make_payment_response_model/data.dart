import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? email;
  String? address;
  dynamic status;
  @JsonKey(name: 'credit limit')
  int? creditLimit;
  @JsonKey(name: 'amount oweing')
  int? amountOweing;
  dynamic city;

  Data({
    this.id,
    this.name,
    this.email,
    this.address,
    this.status,
    this.creditLimit,
    this.amountOweing,
    this.city,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
