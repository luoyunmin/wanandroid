
import 'package:json_annotation/json_annotation.dart';

part 'HotKey.g.dart';

@JsonSerializable()
class HotKey {
  late String name;
  late int id;
  late String link;
  late int order;
  late int visible;

  HotKey();

  factory HotKey.fromJson(Map<String, dynamic> json) => _$HotKeyFromJson(json);

  Map<String, dynamic> toJson() => _$HotKeyToJson(this);
}