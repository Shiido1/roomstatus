import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	int? id;
	String? code;
	String? booking;
	String? customer;
	String? item;
	@JsonKey(name: 'item_price') 
	int? itemPrice;
	String? quantity;
	int? discount;
	@JsonKey(name: 'total_price') 
	int? totalPrice;
	@JsonKey(name: 'customer_type') 
	String? customerType;
	String? date;
	@JsonKey(name: 'mode_of_payment') 
	String? modeOfPayment;
	String? staff;

	Data({
		this.id, 
		this.code, 
		this.booking, 
		this.customer, 
		this.item, 
		this.itemPrice, 
		this.quantity, 
		this.discount, 
		this.totalPrice, 
		this.customerType, 
		this.date, 
		this.modeOfPayment, 
		this.staff, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
