// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      bookings: (json['bookings'] as List<dynamic>?)
          ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
          .toList(),
      grossTotalDue: (json['Gross Total Due'] as num?)?.toInt(),
      totalAmountReceived: (json['Total Amount Received'] as num?)?.toInt(),
      balanceNet: (json['Balance/Net'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'bookings': instance.bookings,
      'Gross Total Due': instance.grossTotalDue,
      'Total Amount Received': instance.totalAmountReceived,
      'Balance/Net': instance.balanceNet,
    };
