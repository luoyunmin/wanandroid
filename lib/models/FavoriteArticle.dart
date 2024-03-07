import 'package:json_annotation/json_annotation.dart';

part 'FavoriteArticle.g.dart';

@JsonSerializable()
class FavoriteArticle {
  late String author;
  late int chapterId;
  late String chapterName;
  late int courseId;
  late String desc;
  late String envelopePic;
  late int id;
  late String link;
  late String niceDate;
  late String origin;
  late int originId;
  late int publishTime;
  late String title;
  late int userId;
  late int visible;
  late int zan;

  FavoriteArticle();

  factory FavoriteArticle.fromJson(Map<String, dynamic> json) => _$FavoriteArticleFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteArticleToJson(this);
}
