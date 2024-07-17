import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'guest_list_response_model.g.dart';

@JsonSerializable()
class GuestListResponseModel {
	List<Datum>? data;
	Links? links;
	Meta? meta;

	GuestListResponseModel({this.data, this.links, this.meta});

	factory GuestListResponseModel.fromJson(Map<String, dynamic> json) {
		return _$GuestListResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GuestListResponseModelToJson(this);
}
