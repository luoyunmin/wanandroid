import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Article.dart';
import '../models/RespData.dart';
import '../network/HttpUtil.dart';
import '../widgets/article_item.dart';

class TreeDetailTabPage extends StatefulWidget {
  TreeDetailTabPage({required this.cid}):super(key: ValueKey(cid));

  final int cid;

  @override
  _TreeDetailTabPageState createState() => _TreeDetailTabPageState();
}

class _TreeDetailTabPageState extends State<TreeDetailTabPage> {
  List<Article> _data = [];
  bool hasMore = true;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    if (hasMore) {
      _requestTreeArticle(
        page,
        widget.cid
      );
    }
    return ListView.builder(
        itemBuilder: (context, index) => ArticleItem(_data[index]),
        itemCount: _data.length);
  }

  void _requestTreeArticle(int page, int cid) async {
    RespData<Article> data = await HttpUtil.getArticles(page, cid: cid);
    setState(() {
      _data.insertAll(0, data.datas);
      hasMore = false;
    });
  }
}
