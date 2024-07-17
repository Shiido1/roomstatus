import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? name;
  String? email;
  String? address;
  dynamic status;
  @JsonKey(name: 'credit limit')
  int? creditLimit;
  @JsonKey(name: 'amount oweing')
  dynamic amountOweing;
  dynamic city;

  Datum({
    this.id,
    this.name,
    this.email,
    this.address,
    this.status,
    this.creditLimit,
    this.amountOweing,
    this.city,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
