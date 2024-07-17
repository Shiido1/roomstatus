class ReportRoomEntityModel {
  String? room;
  String? start;
  String? end;

  ReportRoomEntityModel({this.room, this.start, this.end});

  factory ReportRoomEntityModel.fromJson(Map<String, dynamic> json) {
    return ReportRoomEntityModel(
      room: json['room'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'room': room,
        'start': start,
        'end': end,
      };
}
