import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? number;
  int? price;
  String? type;
  String? status;
  String? character;
  String? floor;
  @JsonKey(name: 'bed_type')
  String? bedType;
  String? image;
  String? date;

  Data({
    this.id,
    this.number,
    this.price,
    this.type,
    this.status,
    this.character,
    this.floor,
    this.bedType,
    this.image,
    this.date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
