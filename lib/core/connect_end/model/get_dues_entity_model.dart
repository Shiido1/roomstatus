class GetDuesEntityModel {
	String? bookableId;
	String? checkedIn;
	String? checkedOut;

	GetDuesEntityModel({this.bookableId, this.checkedIn, this.checkedOut});

	factory GetDuesEntityModel.fromJson(Map<String, dynamic> json) {
		return GetDuesEntityModel(
			bookableId: json['bookable_id'] as String?,
			checkedIn: json['checked_in'] as String?,
			checkedOut: json['checked_out'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'bookable_id': bookableId,
				'checked_in': checkedIn,
				'checked_out': checkedOut,
			};
}
