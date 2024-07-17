class ReportSalesEntityModel {
	String? itemId;
	String? start;
	String? end;

	ReportSalesEntityModel({this.itemId, this.start, this.end});

	factory ReportSalesEntityModel.fromJson(Map<String, dynamic> json) {
		return ReportSalesEntityModel(
			itemId: json['item_id'] as String?,
			start: json['start'] as String?,
			end: json['end'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'item_id': itemId,
				'start': start,
				'end': end,
			};
}
