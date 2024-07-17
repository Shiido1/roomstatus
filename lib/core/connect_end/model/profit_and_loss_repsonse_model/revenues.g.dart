// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Revenues _$RevenuesFromJson(Map<String, dynamic> json) => Revenues(
      room: (json['room'] as num?)?.toInt(),
      hall: (json['hall'] as num?)?.toInt(),
      orders: (json['orders'] as num?)?.toInt(),
      totalRevenue: (json['Total Revenue'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RevenuesToJson(Revenues instance) => <String, dynamic>{
      'room': instance.room,
      'hall': instance.hall,
      'orders': instance.orders,
      'Total Revenue': instance.totalRevenue,
    };
