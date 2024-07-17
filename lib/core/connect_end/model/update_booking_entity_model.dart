class UpdateBookingEntityModel {
	String? amountPaid;
	String? checkedIn;
	String? checkedOut;
	String? modeOfPayment;
	String? discount;

	UpdateBookingEntityModel({
		this.amountPaid, 
		this.checkedIn, 
		this.checkedOut, 
		this.modeOfPayment, 
		this.discount, 
	});

	factory UpdateBookingEntityModel.fromJson(Map<String, dynamic> json) {
		return UpdateBookingEntityModel(
			amountPaid: json['amount_paid'] as String?,
			checkedIn: json['checked_in'] as String?,
			checkedOut: json['checked_out'] as String?,
			modeOfPayment: json['mode_of_payment'] as String?,
			discount: json['discount'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'amount_paid': amountPaid,
				'checked_in': checkedIn,
				'checked_out': checkedOut,
				'mode_of_payment': modeOfPayment,
				'discount': discount,
			};
}
