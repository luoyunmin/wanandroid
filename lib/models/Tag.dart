import 'package:json_annotation/json_annotation.dart';

part 'Tag.g.dart';

@JsonSerializable()
class Tag{
  late String name;
  late String url;

  Tag();

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson()  => _$TagToJson(this);
}