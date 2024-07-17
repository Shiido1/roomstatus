import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? name;
  String? address;
  @JsonKey(name: 'city_id')
  String? cityId;
  String? logo;
  String? telephone;
  String? email;
  String? code;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  int? id;
  DateTime? renew;

  Data({
    this.name,
    this.address,
    this.cityId,
    this.logo,
    this.telephone,
    this.email,
    this.code,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.renew,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
