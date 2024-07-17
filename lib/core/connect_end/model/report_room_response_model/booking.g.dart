// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      amountPaid: (json['amount_paid'] as num?)?.toInt(),
      due: (json['due'] as num?)?.toInt(),
      net: (json['net'] as num?)?.toInt(),
      checkedIn: json['checked_in'] as String?,
      checkedOut: json['checked_out'] as String?,
      info: json['Info'] as String?,
      discount: (json['discount'] as num?)?.toInt(),
      status: json['status'] as String?,
      customer: json['customer'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      agent: json['agent'] as String?,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'amount_paid': instance.amountPaid,
      'due': instance.due,
      'net': instance.net,
      'checked_in': instance.checkedIn,
      'checked_out': instance.checkedOut,
      'Info': instance.info,
      'discount': instance.discount,
      'status': instance.status,
      'customer': instance.customer,
      'phone': instance.phone,
      'image': instance.image,
      'agent': instance.agent,
    };
