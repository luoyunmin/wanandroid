import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/RespData.dart';
import 'package:wanandroid/network/HttpUtil.dart';

import '../models/Article.dart';
import '../widgets/article_item.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage>  with AutomaticKeepAliveClientMixin{
  final List<Article> _data = [];
  bool hasMore = true;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("问答"),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (hasMore) {
      _requestDayQuestion(page);
    }
    return ListView.builder(
        itemBuilder: (context, index) => ArticleItem(_data[index]),
        itemCount: _data.length);
  }

  void _requestDayQuestion(int page) async {
    RespData<Article> data = await HttpUtil.getDayQuestion(page);
    setState(() {
      hasMore = false;
      _data.insertAll(0, data.datas);
      page++;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
