class UpdateSalesEntity {
	String? type;
	String? quantity;
	String? modeOfPayment;
	String? totalPrice;

	UpdateSalesEntity({
		this.type, 
		this.quantity, 
		this.modeOfPayment, 
		this.totalPrice, 
	});

	factory UpdateSalesEntity.fromJson(Map<String, dynamic> json) {
		return UpdateSalesEntity(
			type: json['type'] as String?,
			quantity: json['quantity'] as String?,
			modeOfPayment: json['mode_of_payment'] as String?,
			totalPrice: json['total_price'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'type': type,
				'quantity': quantity,
				'mode_of_payment': modeOfPayment,
				'total_price': totalPrice,
			};
}
