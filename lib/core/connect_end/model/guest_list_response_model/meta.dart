import 'package:json_annotation/json_annotation.dart';

import 'link.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
	@JsonKey(name: 'current_page') 
	int? currentPage;
	int? from;
	@JsonKey(name: 'last_page') 
	int? lastPage;
	List<Link>? links;
	String? path;
	@JsonKey(name: 'per_page') 
	int? perPage;
	int? to;
	int? total;

	Meta({
		this.currentPage, 
		this.from, 
		this.lastPage, 
		this.links, 
		this.path, 
		this.perPage, 
		this.to, 
		this.total, 
	});

	factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

	Map<String, dynamic> toJson() => _$MetaToJson(this);
}
