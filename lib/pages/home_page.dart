import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:wanandroid/data/icons.dart';
import 'package:wanandroid/models/Article.dart';
import 'package:wanandroid/network/HttpUtil.dart';
import 'package:wanandroid/util/ListUtil.dart';
import 'package:wanandroid/widgets/article_item.dart';

import '../models/BannerModel.dart';
import '../models/RespData.dart';
import '../util/Log.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final List<Article> _data = [];
  final List<BannerModel> _bannerData = [];
  bool hasMore = true;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Log.i("home page build ${hasMore}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            WanAndroidIcons.scan,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("search");
            },
            icon: const Icon(
              WanAndroidIcons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (hasMore) {
      _requestArticle(page);
    }
    var children = <Widget>[];
    if (_bannerData.isEmpty) {
      _requestBanner();
    } else {
      children.add(
        AspectRatio(
          aspectRatio: 9 / 5,
          child: Swiper(
              itemBuilder: (context, index) =>
                  CachedNetworkImage(imageUrl: _bannerData[index].imagePath),
              itemCount: _bannerData.length),
        ),
      );
    }
    if (_data.isNotEmpty) {
      children.addAll(_data.map((e) => ArticleItem(e)).toList());
    }
    return ListView(
      children: children,
    );
  }

  void _requestBanner() async {
    List<BannerModel> data = await HttpUtil.getBanner();
    if (!ListUtil.isEmpty(data)) {
      setState(() {
        _bannerData.insertAll(0, data);
      });
    }
  }

  void _requestArticle(int page) async {
    RespData<Article> data = await HttpUtil.getArticles(page);
    List<Article> top = await HttpUtil.getTopArticle();
    setState(() {
      hasMore = false;
      _data.insertAll(0, data.datas);
      _data.insertAll(0, top);
      page++;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
