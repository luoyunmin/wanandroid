
import 'package:json_annotation/json_annotation.dart';
import 'package:wanandroid/models/Article.dart';

part 'Tree.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Tree {
  late List<Article> articleList;
  late String author;
  late List<Tree> children;
  late int courseId;
  late String cover;
  late String desc;
  late int id;
  late String lisense;
  late String lisenseLink;
  late String name;
  late int order;
  late int parentChapterId;
  late int type;
  late bool userControlSetTop;
  late int visible;

  Tree();

  factory Tree.fromJson(Map<String, dynamic> json) => _$TreeFromJson(json);
  Map<String, dynamic> toJson() => _$TreeToJson(this);

}