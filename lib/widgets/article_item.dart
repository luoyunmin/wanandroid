import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/data/icons.dart';
import 'package:wanandroid/models/Article.dart';
import 'package:wanandroid/util/StringUtil.dart';

class ArticleItem extends StatefulWidget {
  final Article data;

  ArticleItem(this.data) : super(key: ValueKey(data.id));

  @override
  _ArticleItemState createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    String author = widget.data.author.isNotEmpty
        ? widget.data.author
        : widget.data.shareUser;
    var authorTags = <Widget>[Text(author)];
    if (widget.data.tags.isNotEmpty) {
      authorTags.add(Text(widget.data.tags[0].name));
    }

    var topChapter = <Widget>[];
    if (widget.data.type == 1) {
      topChapter.add(const Text("置顶"));
    }
    topChapter.add(
        Text("${widget.data.superChapterName}·${widget.data.chapterName}"));
    var content = <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: authorTags,
          ),
          Text(widget.data.niceDate)
        ],
      ),
      Text(
        widget.data.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ];
    if (widget.data.desc.isNotEmpty) {
      content.add(Text(
        StringUtil.strClean(widget.data.desc),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ));
    }
    content.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: topChapter),
        const Icon(WanAndroidIcons.favorites, color: Colors.deepOrangeAccent)
      ],
    ));

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("web", arguments: widget.data.link);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content,
        ),
      ),
    );
  }
}
