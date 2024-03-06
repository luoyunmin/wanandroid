import 'package:json_annotation/json_annotation.dart';

import 'Article.dart';

part 'Navi.g.dart';

@JsonSerializable()
class Navi{
  late int cid;
  late String name;
  late List<Article> articles;

  Navi();

  factory Navi.fromJson(Map<String, dynamic> json) => _$NaviFromJson(json);
  Map<String, dynamic> toJson() => _$NaviToJson(this);
}