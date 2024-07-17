import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_booking_history.g.dart';

@JsonSerializable()
class GetAllBookingHistory {
  bool? success;
  String? message;
  Data? data;

  GetAllBookingHistory({this.success, this.message, this.data});

  factory GetAllBookingHistory.fromJson(Map<String, dynamic> json) {
    return _$GetAllBookingHistoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllBookingHistoryToJson(this);
}
