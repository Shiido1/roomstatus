import 'package:json_annotation/json_annotation.dart';

part 'expenditures.g.dart';

@JsonSerializable()
class Expenditures {
	@JsonKey(name: 'total expense') 
	int? totalExpense;

	Expenditures({this.totalExpense});

	factory Expenditures.fromJson(Map<String, dynamic> json) {
		return _$ExpendituresFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ExpendituresToJson(this);
}
