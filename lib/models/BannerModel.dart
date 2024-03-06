import 'package:json_annotation/json_annotation.dart';

part 'BannerModel.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BannerModel {
  late int id;
  late String desc;
  late String imagePath;
  late int isVisible;
  late int order;
  late String title;
  late int type;
  late String url;

  BannerModel();

  factory BannerModel.fromJson(Map<String,dynamic> json) => _$BannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
