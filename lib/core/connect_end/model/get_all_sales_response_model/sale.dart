import 'package:json_annotation/json_annotation.dart';

part 'sale.g.dart';

@JsonSerializable()
class Sale {
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
	@JsonKey(name: 'items_count') 
	int? itemsCount;

	Sale({
		this.id, 
		this.code, 
		this.total, 
		this.booking, 
		this.customer, 
		this.customerType, 
		this.date, 
		this.modeOfPayment, 
		this.staff, 
		this.itemsCount, 
	});

	factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

	Map<String, dynamic> toJson() => _$SaleToJson(this);
}
