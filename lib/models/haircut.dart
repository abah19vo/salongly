import 'package:json_annotation/json_annotation.dart';
import 'package:salongly/app/enums.dart';
part 'haircut.g.dart';

@JsonSerializable()
class Haircut {
  String id;
  String name;
  String description;
  String imgUrl;
  int rating;
  int price;
  HaircutType? type;

  Haircut({
    this.id = '',
    this.name = '',
    this.description = '',
    this.imgUrl = '',
    this.rating = 0,
    this.price = -1,
    this.type,
  });

  factory Haircut.fromJson(Map<String, dynamic> json) => _$HaircutFromJson(json);

  Map<String, dynamic> toJson() => _$HaircutToJson(this);
}
