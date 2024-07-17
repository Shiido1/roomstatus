import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'get_all_items_response_model.g.dart';

@JsonSerializable()
class GetAllItemsResponseModel {
  List<Datum>? data;
  Links? links;
  Meta? meta;

  GetAllItemsResponseModel({this.data, this.links, this.meta});

  factory GetAllItemsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllItemsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllItemsResponseModelToJson(this);
}
