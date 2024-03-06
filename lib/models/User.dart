import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  // {"data":{"admin":false,"chapterTops":[],"coinCount":0,"collectIds":[],"email":"","icon":"","id":159500,"nickname":"18898830981","password":"","publicName":"18898830981","token":"","type":0,"username":"18898830981"},"errorCode":0,"errorMsg":""}
  late bool admin;
  late int coinCount;
  late String email;
  late String icon;
  late int id;
  late List chapterTops;
  late List collectIds;
  late String nickname;
  late String password;
  late String publicName;
  late String token;
  late int type;
  late String username;
  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
