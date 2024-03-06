import 'package:json_annotation/json_annotation.dart';

import 'Tag.dart';

part 'Article.g.dart';

@JsonSerializable()
class Article {
  late bool adminAdd;
  late String apkLink;
  late int audit;
  late String author;
  late bool canEdit;
  late int chapterId;
  late String chapterName;
  late bool collect;
  late int courseId;
  late String desc;
  late String descMd;
  late String envelopePic;
  late bool fresh;
  late String host;
  late int id;
  late bool isAdminAdd;
  late String link;
  late String niceDate;
  late String niceShareDate;
  late String origin;
  late String prefix;
  late String projectLink;
  late int publishTime;
  late int realSuperChapterId;
  late int selfVisible;
  // late int? shareDate;
  late String shareUser;
  late int superChapterId;
  late String superChapterName;
  late List<Tag> tags;
  late String title;
  late int type;
  late int userId;
  late int visible;
  late int zan;

  Article();

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
