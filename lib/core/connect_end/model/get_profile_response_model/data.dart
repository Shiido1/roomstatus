import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  @JsonKey(name: 'current_role')
  String? currentRole;
  String? username;
  dynamic department;
  String? hotel;
  @JsonKey(name: 'hotel_code')
  String? hotelCode;
  @JsonKey(name: 'hotel_has_vat')
  int? hotelHasVat;
  @JsonKey(name: 'hotel_logo')
  String? hotelLogo;

  Data({
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.currentRole,
    this.username,
    this.department,
    this.hotel,
    this.hotelCode,
    this.hotelHasVat,
    this.hotelLogo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
