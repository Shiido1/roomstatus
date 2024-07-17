import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
	int? id;
	@JsonKey(name: 'item_id') 
	int? itemId;
	String? item;
	@JsonKey(name: 'item_price') 
	int? itemPrice;
	int? quantity;
	dynamic discount;
	String? image;
	@JsonKey(name: 'total_price') 
	int? totalPrice;

	Item({
		this.id, 
		this.item, 
    this.itemId,
		this.itemPrice, 
		this.quantity, 
		this.discount, 
		this.image, 
		this.totalPrice, 
	});

	factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

	Map<String, dynamic> toJson() => _$ItemToJson(this);
}
