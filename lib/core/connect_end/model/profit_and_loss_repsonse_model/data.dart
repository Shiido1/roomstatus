import 'package:json_annotation/json_annotation.dart';

import 'expenditures.dart';
import 'revenues.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	Revenues? revenues;
	Expenditures? expenditures;
	int? balance;

	Data({this.revenues, this.expenditures, this.balance});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
