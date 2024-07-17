import 'package:json_annotation/json_annotation.dart';

part 'id_card_reponse_model.g.dart';

@JsonSerializable()
class IdCardReponseModel {
  List<String>? data;

  IdCardReponseModel({this.data});

  factory IdCardReponseModel.fromJson(Map<String, dynamic> json) {
    return _$IdCardReponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IdCardReponseModelToJson(this);
}
