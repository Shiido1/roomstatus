// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: (json['id'] as num?)?.toInt(),
      number: json['number'] as String?,
      price: (json['price'] as num?)?.toInt(),
      type: json['type'] as String?,
      status: json['status'] as String?,
      character: json['character'] as String?,
      floor: json['floor'] as String?,
      bedType: json['bed_type'] as String?,
      image: json['image'] as String?,
      date: json['date'],
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'price': instance.price,
      'type': instance.type,
      'status': instance.status,
      'character': instance.character,
      'floor': instance.floor,
      'bed_type': instance.bedType,
      'image': instance.image,
      'date': instance.date,
    };
