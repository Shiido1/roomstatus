class ProfitAndLossEntityModel {
	String? start;
	String? end;

	ProfitAndLossEntityModel({this.start, this.end});

	factory ProfitAndLossEntityModel.fromJson(Map<String, dynamic> json) {
		return ProfitAndLossEntityModel(
			start: json['start'] as String?,
			end: json['end'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'start': start,
				'end': end,
			};
}
