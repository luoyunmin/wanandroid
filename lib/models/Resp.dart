import 'package:json_annotation/json_annotation.dart';

part 'Resp.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Resp<T> {
  late int errorCode;
  late String errorMsg;
  late T data;

  Resp();

  factory Resp.fromJson(Map<String,dynamic> json, T Function(dynamic json) fromJsonT) => _$RespFromJson<T>(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$RespToJson<T>(this, toJsonT);
}
