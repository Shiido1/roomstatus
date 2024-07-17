import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? name;
  int? price;
  String? category;
  String? image;
  int? quantity;

  Datum(
      {this.id,
      this.name,
      this.price,
      this.category,
      this.image,
      this.quantity});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    String? name,
    int? price,
    String? category,
    String? image,
    int? quantity,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? category,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
    );
  }
}
