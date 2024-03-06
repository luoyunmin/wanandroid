import 'package:json_annotation/json_annotation.dart';

part 'RespData.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class RespData<T> {
  late int curPage;
  late List<T> datas;
  late int offset;
  late bool over;
  late int pageCount;
  late int size;
  late int total;

  RespData();

  factory RespData.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) => _$RespDataFromJson<T>(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$RespDataToJson<T>(this, toJsonT);
}