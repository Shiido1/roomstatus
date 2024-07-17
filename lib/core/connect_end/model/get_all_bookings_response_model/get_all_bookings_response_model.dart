import 'package:json_annotation/json_annotation.dart';

import 'booking.dart';

part 'get_all_bookings_response_model.g.dart';

@JsonSerializable()
class GetAllBookingsResponseModel {
  List<Booking>? bookings;

  GetAllBookingsResponseModel({this.bookings});

  factory GetAllBookingsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllBookingsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllBookingsResponseModelToJson(this);
}
