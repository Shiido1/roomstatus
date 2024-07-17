import 'item.dart';

class AddSalesEntityModel {
	String? type;
	String? modeOfPayment;
	int? discount;
	int? bookingId;
	List<Item>? items;

	AddSalesEntityModel({
		this.type, 
		this.modeOfPayment, 
		this.discount, 
		this.bookingId, 
		this.items, 
	});

	factory AddSalesEntityModel.fromJson(Map<String, dynamic> json) {
		return AddSalesEntityModel(
			type: json['type'] as String?,
			modeOfPayment: json['mode_of_payment'] as String?,
			discount: json['discount'] as int?,
			bookingId: json['booking_id'] as int?,
			items: (json['items'] as List<dynamic>?)
						?.map((e) => Item.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'type': type,
				'mode_of_payment': modeOfPayment,
				'discount': discount,
				'booking_id': bookingId,
				'items': items?.map((e) => e.toJson()).toList(),
			};
}
