import 'package:json_annotation/json_annotation.dart';

part 'get_items_category_response_model.g.dart';

@JsonSerializable()
class GetItemsCategoryResponseModel {
  int? id;
  String? source;

  GetItemsCategoryResponseModel({this.id, this.source});

  factory GetItemsCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetItemsCategoryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetItemsCategoryResponseModelToJson(this);
}

class GetItemsCategoryResponseModelList {
  final List<GetItemsCategoryResponseModel>? categoryItem;

  GetItemsCategoryResponseModelList({
    this.categoryItem,
  });

  factory GetItemsCategoryResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<GetItemsCategoryResponseModel>? categoryItem =
        <GetItemsCategoryResponseModel>[];
    categoryItem = parsedJson
        .map((e) => GetItemsCategoryResponseModel.fromJson(e))
        .toList();

    return GetItemsCategoryResponseModelList(
      categoryItem: categoryItem,
    );
  }
}
