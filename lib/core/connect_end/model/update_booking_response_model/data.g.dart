// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      type: json['type'] as String?,
      bookedItem: json['Booked Item'] as String?,
      price: (json['price'] as num?)?.toInt(),
      due: (json['due'] as num?)?.toInt(),
      amountPaid: json['amount_paid'] as String?,
      discount: json['discount'] as String?,
      checkedIn: json['checked_in'] as String?,
      checkedOut: json['checked_out'] as String?,
      status: json['status'] as String?,
      modeOfPayment: json['mode_of_payment'] as String?,
      customer: json['customer'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      agent: json['agent'] as String?,
      sales: json['sales'] as List<dynamic>?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'type': instance.type,
      'Booked Item': instance.bookedItem,
      'price': instance.price,
      'due': instance.due,
      'amount_paid': instance.amountPaid,
      'discount': instance.discount,
      'checked_in': instance.checkedIn,
      'checked_out': instance.checkedOut,
      'status': instance.status,
      'mode_of_payment': instance.modeOfPayment,
      'customer': instance.customer,
      'phone': instance.phone,
      'email': instance.email,
      'image': instance.image,
      'agent': instance.agent,
      'sales': instance.sales,
    };
