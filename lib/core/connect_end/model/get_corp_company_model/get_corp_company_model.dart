import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_corp_company_model.g.dart';

@JsonSerializable()
class GetCorpCompanyModel {
  bool? success;
  String? message;
  List<Datum>? data;

  GetCorpCompanyModel({this.success, this.message, this.data});

  factory GetCorpCompanyModel.fromJson(Map<String, dynamic> json) {
    return _$GetCorpCompanyModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCorpCompanyModelToJson(this);
}
