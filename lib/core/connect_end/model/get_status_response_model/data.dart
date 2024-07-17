import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'All')
  int? all;
  int? available;
  int? unpaid;
  int? paid;
  int? occupied;
  int? repair;
  int? dirty;

  Data({
    this.all,
    this.available,
    this.unpaid,
    this.paid,
    this.occupied,
    this.repair,
    this.dirty,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
