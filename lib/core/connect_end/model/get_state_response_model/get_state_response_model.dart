import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'get_state_response_model.g.dart';

@JsonSerializable()
class GetStateResponseModel {
  List<Datum>? data;
  Links? links;
  Meta? meta;

  GetStateResponseModel({this.data, this.links, this.meta});

  factory GetStateResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetStateResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetStateResponseModelToJson(this);
}
