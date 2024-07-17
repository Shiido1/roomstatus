class ReportHallEntityModel {
  String? hall;
  String? start;
  String? end;

  ReportHallEntityModel({this.hall, this.start, this.end});

  factory ReportHallEntityModel.fromJson(Map<String, dynamic> json) {
    return ReportHallEntityModel(
      hall: json['hall'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'hall': hall,
        'start': start,
        'end': end,
      };
}
