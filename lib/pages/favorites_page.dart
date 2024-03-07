import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/models/FavoriteArticle.dart';
import 'package:wanandroid/models/RespData.dart';
import 'package:wanandroid/network/HttpUtil.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<FavoriteArticle> _data = [];
  bool _hasMore = true;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context)!;
    if (_hasMore) {
      _requestFacorites(_page);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(local.favorites),
        centerTitle: true,
      ),
      body: ListView(children: _data.map((e) => Text(e.title)).toList()),
    );
  }

  void _requestFacorites(int page) async {
    RespData<FavoriteArticle> resp = await HttpUtil.getFavorites(page);
    setState(() {
      _hasMore = false;
      _data.insertAll(0, resp.datas);
    });
  }
}
