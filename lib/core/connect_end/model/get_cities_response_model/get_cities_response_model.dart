import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'get_cities_response_model.g.dart';

@JsonSerializable()
class GetCitiesResponseModel {
  List<Datum>? data;
  Links? links;
  Meta? meta;

  GetCitiesResponseModel({this.data, this.links, this.meta});

  factory GetCitiesResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetCitiesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCitiesResponseModelToJson(this);
}
