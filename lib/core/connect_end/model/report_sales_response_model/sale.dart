import 'package:json_annotation/json_annotation.dart';

part 'sale.g.dart';

@JsonSerializable()
class Sale {
	int? id;
	String? image;
	String? code;
	String? booking;
	String? customer;
	String? item;
	@JsonKey(name: 'item_price') 
	int? itemPrice;
	int? quantity;
	int? discount;
	@JsonKey(name: 'total_price') 
	int? totalPrice;
	@JsonKey(name: 'customer_type') 
	String? customerType;
	String? date;
	@JsonKey(name: 'mode_of_payment') 
	String? modeOfPayment;
	String? staff;

	Sale({
		this.id, 
		this.image, 
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

	factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

	Map<String, dynamic> toJson() => _$SaleToJson(this);
}
