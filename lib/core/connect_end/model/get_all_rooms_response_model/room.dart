import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
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
  dynamic date;

  Room({
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

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
