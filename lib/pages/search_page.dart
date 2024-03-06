import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/Article.dart';
import 'package:wanandroid/models/RespData.dart';
import 'package:wanandroid/network/HttpUtil.dart';
import 'package:wanandroid/widgets/article_item.dart';

import '../models/HotKey.dart';
import '../util/Log.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<HotKey> _hotSearchData = [];
  final List<String> _historySearchData = [];
  final List<Article> _searchResultData = [];
  String _searchText = "";
  int _page = 0;
  bool _hasMore = true;
  late TextEditingController _searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_hotSearchData.isEmpty) {
      _requestHotSearch();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "用空格隔开多个关键词",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              if (!_historySearchData.contains(_searchController.text)) {
                setState(() {
                  _historySearchData.insert(0, _searchController.text);
                });
              }
              setState(() {
                _searchResultData.clear();
              });
              _requestQuerySearch(_page);
            },
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_searchText.isEmpty) {
      var children = [
        const Text("热门搜索"),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 12,
          runAlignment: WrapAlignment.start,
          runSpacing: 12,
          children: _hotSearchData
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    if (_historySearchData.contains(e.name)) {
                      setState(() {
                        _searchController.text = e.name;
                      });
                    } else {
                      setState(() {
                        _searchController.text = e.name;
                        _historySearchData.insert(0, e.name);
                      });
                    }
                    setState(() {
                      _searchText = e.name;
                      _searchResultData.clear();
                    });
                    _requestQuerySearch(_page);
                  },
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 12),
                      child: Text(
                        e.name,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ];
      if (_historySearchData.isNotEmpty) {
        children.addAll([
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("历史搜索"),
              TextButton(
                onPressed: () {
                  setState(() {
                    _historySearchData.clear();
                  });
                },
                child: Text("清除"),
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 12,
            runAlignment: WrapAlignment.start,
            runSpacing: 12,
            children: _historySearchData
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      _searchController.text = e;
                      setState(() {
                        _searchText = e;
                      });
                    },
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ]);
      }
      return Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    } else {
      Log.i("build search result");
      return ListView(children: _searchResultData.map((e) => ArticleItem(e)).toList());
    }
  }

  void _requestHotSearch() async {
    List<HotKey> data = await HttpUtil.getHotSearch();
    setState(() {
      _hotSearchData.insertAll(0, data);
    });
  }

  void _requestQuerySearch(int page) async {
    Log.i("seatchText: $_searchText");
    RespData<Article> data = await HttpUtil.searchArticle(page, _searchText);
    setState(() {
      _hasMore = false;
      _searchResultData.insertAll(0, data.datas);
    });
  }
}
