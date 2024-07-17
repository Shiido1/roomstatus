class GuestListEntityModel {
	String? date;

	GuestListEntityModel({this.date});

	factory GuestListEntityModel.fromJson(Map<String, dynamic> json) {
		return GuestListEntityModel(
			date: json['date'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'date': date,
			};
}
