// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      all: (json['All'] as num?)?.toInt(),
      available: (json['available'] as num?)?.toInt(),
      unpaid: (json['unpaid'] as num?)?.toInt(),
      paid: (json['paid'] as num?)?.toInt(),
      occupied: (json['occupied'] as num?)?.toInt(),
      repair: (json['repair'] as num?)?.toInt(),
      dirty: (json['dirty'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'All': instance.all,
      'available': instance.available,
      'unpaid': instance.unpaid,
      'paid': instance.paid,
      'occupied': instance.occupied,
      'repair': instance.repair,
      'dirty': instance.dirty,
    };
