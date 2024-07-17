import 'package:json_annotation/json_annotation.dart';

import 'sale.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	List<Sale>? sales;
	@JsonKey(name: 'Total items quantity sold') 
	int? totalItemsQuantitySold;
	@JsonKey(name: 'Average Discount') 
	String? averageDiscount;
	@JsonKey(name: 'Total Amount Generated') 
	int? totalAmountGenerated;

	Data({
		this.sales, 
		this.totalItemsQuantitySold, 
		this.averageDiscount, 
		this.totalAmountGenerated, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
