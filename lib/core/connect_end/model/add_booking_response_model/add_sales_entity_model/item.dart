class Item {
	int? quantity;
	int? itemId;

	Item({this.quantity, this.itemId});

	factory Item.fromJson(Map<String, dynamic> json) => Item(
				quantity: json['quantity'] as int?,
				itemId: json['item_id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'quantity': quantity,
				'item_id': itemId,
			};
}
