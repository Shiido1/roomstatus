import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	int? id;
	String? code;
	dynamic total;
	String? booking;
	String? customer;
	@JsonKey(name: 'customer_type') 
	String? customerType;
	String? date;
	@JsonKey(name: 'mode_of_payment') 
	String? modeOfPayment;
	String? staff;
	List<Item>? items;

	Data({
		this.id, 
		this.code, 
		this.total, 
		this.booking, 
		this.customer, 
		this.customerType, 
		this.date, 
		this.modeOfPayment, 
		this.staff, 
		this.items, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
