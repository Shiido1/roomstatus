import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  int? id;
  String? code;
  @JsonKey(name: 'amount_paid')
  int? amountPaid;
  @JsonKey(name: 'checked_in')
  String? checkedIn;
  @JsonKey(name: 'checked_out')
  String? checkedOut;
  String? status;
  String? customer;
  String? phone;
  String? image;
  String? agent;

  Booking({
    this.id,
    this.code,
    this.amountPaid,
    this.checkedIn,
    this.checkedOut,
    this.status,
    this.customer,
    this.phone,
    this.image,
    this.agent,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return _$BookingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
