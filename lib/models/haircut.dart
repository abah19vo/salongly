import 'package:json_annotation/json_annotation.dart';
part 'generated/haircut.g.dart';

@JsonSerializable()
class Haircut {
  String id;
  String name;
  String description;
  String imgUrl;

  Haircut({
    this.id = '',
    this.name = '',
    this.description = '',
    this.imgUrl = '',
  });

  factory Haircut.fromJson(Map<String, dynamic> json) => _$HaircutFromJson(json);

  Map<String, dynamic> toJson() => _$HaircutToJson(this);
}
