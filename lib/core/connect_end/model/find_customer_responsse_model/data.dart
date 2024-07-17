import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? firstname;
  String? lastname;
  String? phone;
  String? email;
  String? address;
  @JsonKey(name: 'city_id')
  dynamic cityId;
  @JsonKey(name: 'state_id')
  dynamic stateId;
  @JsonKey(name: 'country_id')
  dynamic countryId;
  @JsonKey(name: 'business_id')
  dynamic businessId;
  @JsonKey(name: 'id_type')
  String? idType;
  @JsonKey(name: 'id_number')
  String? idNumber;

  Data({
    this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.email,
    this.address,
    this.cityId,
    this.stateId,
    this.countryId,
    this.businessId,
    this.idType,
    this.idNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
