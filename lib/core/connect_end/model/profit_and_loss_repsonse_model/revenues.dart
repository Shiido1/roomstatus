import 'package:json_annotation/json_annotation.dart';

part 'revenues.g.dart';

@JsonSerializable()
class Revenues {
	int? room;
	int? hall;
	int? orders;
	@JsonKey(name: 'Total Revenue') 
	int? totalRevenue;

	Revenues({this.room, this.hall, this.orders, this.totalRevenue});

	factory Revenues.fromJson(Map<String, dynamic> json) {
		return _$RevenuesFromJson(json);
	}

	Map<String, dynamic> toJson() => _$RevenuesToJson(this);
}
