import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'single_sales_response_model.g.dart';

@JsonSerializable()
class SingleSalesResponseModel {
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

	SingleSalesResponseModel({
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

	factory SingleSalesResponseModel.fromJson(Map<String, dynamic> json) {
		return _$SingleSalesResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SingleSalesResponseModelToJson(this);
}
