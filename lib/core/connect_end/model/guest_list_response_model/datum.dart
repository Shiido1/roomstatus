import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	int? id;
	@JsonKey(name: 'checked_in') 
	String? checkedIn;
	@JsonKey(name: 'checked_out') 
	String? checkedOut;
	@JsonKey(name: 'Room') 
	String? room;
	String? customer;
	String? phone;
	@JsonKey(name: 'id_type') 
	String? idType;
	@JsonKey(name: 'id_number') 
	String? idNumber;

	Datum({
		this.id, 
		this.checkedIn, 
		this.checkedOut, 
		this.room, 
		this.customer, 
		this.phone, 
		this.idType, 
		this.idNumber, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
