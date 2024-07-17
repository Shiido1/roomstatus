import 'package:json_annotation/json_annotation.dart';

part 'get_single_items_response_model.g.dart';

@JsonSerializable()
class GetSingleItemsResponseModel {
  int? id;
  String? name;
  int? price;
  String? category;
  String? image;

  GetSingleItemsResponseModel({
    this.id,
    this.name,
    this.price,
    this.category,
    this.image,
  });

  factory GetSingleItemsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetSingleItemsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetSingleItemsResponseModelToJson(this);
}
