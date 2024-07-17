import 'package:json_annotation/json_annotation.dart';

part 'get_occupied_bookings_response_model.g.dart';

@JsonSerializable()
class GetOccupiedBookingsResponseModel {
  int? id;
  String? details;

  GetOccupiedBookingsResponseModel({this.id, this.details});

  factory GetOccupiedBookingsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetOccupiedBookingsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetOccupiedBookingsResponseModelToJson(this);
  }
}

class GetOccupiedBookingsResponseModelList {
  final List<GetOccupiedBookingsResponseModel>? occupiedBookings;

  GetOccupiedBookingsResponseModelList({
    this.occupiedBookings,
  });

  factory GetOccupiedBookingsResponseModelList.fromJson(
      List<dynamic> parsedJson) {
    List<GetOccupiedBookingsResponseModel>? occupiedBookings =
        <GetOccupiedBookingsResponseModel>[];
    occupiedBookings = parsedJson
        .map((e) => GetOccupiedBookingsResponseModel.fromJson(e))
        .toList();

    return GetOccupiedBookingsResponseModelList(
      occupiedBookings: occupiedBookings,
    );
  }
}
