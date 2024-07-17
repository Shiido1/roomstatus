import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	int? id;
	String? code;
	String? type;
	@JsonKey(name: 'Booked Item') 
	String? bookedItem;
	int? price;
	int? due;
	@JsonKey(name: 'amount_paid') 
	int? amountPaid;
	int? discount;
	@JsonKey(name: 'checked_in') 
	String? checkedIn;
	@JsonKey(name: 'checked_out') 
	String? checkedOut;
	String? status;
	@JsonKey(name: 'mode_of_payment') 
	String? modeOfPayment;
	String? customer;
	String? agent;
	String? image;
	String? email;
	String? phone;
	List<dynamic>? sales;

	Data({
		this.id, 
		this.code, 
		this.type, 
		this.bookedItem, 
		this.price, 
		this.due, 
		this.amountPaid, 
		this.discount, 
		this.checkedIn, 
		this.checkedOut, 
		this.status, 
		this.modeOfPayment, 
		this.customer, 
		this.agent, 
		this.sales, 
    this.email,
    this.phone,
    this.image,
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
