import 'package:json_annotation/json_annotation.dart';

import 'room.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Room>? rooms;

  Data({this.rooms});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
