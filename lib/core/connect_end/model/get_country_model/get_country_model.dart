import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'get_country_model.g.dart';

@JsonSerializable()
class GetCountryModel {
  List<Datum>? data;
  Links? links;
  Meta? meta;

  GetCountryModel({this.data, this.links, this.meta});

  factory GetCountryModel.fromJson(Map<String, dynamic> json) {
    return _$GetCountryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCountryModelToJson(this);
}
