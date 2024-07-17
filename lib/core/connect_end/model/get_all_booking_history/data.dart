import 'package:json_annotation/json_annotation.dart';

import 'booking.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Booking>? bookings;
  @JsonKey(name: 'Gross Total Due')
  int? grossTotalDue;
  @JsonKey(name: 'Total Amount Received')
  int? totalAmountReceived;
  @JsonKey(name: 'Balance/Net')
  int? balanceNet;

  Data({
    this.bookings,
    this.grossTotalDue,
    this.totalAmountReceived,
    this.balanceNet,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
