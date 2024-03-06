import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/Tree.dart';
import 'package:wanandroid/pages/tree_detail_tab_page.dart';

import '../models/Pair.dart';
import '../util/Log.dart';

class TreeDetailPage extends StatelessWidget {
  TreeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Pair<int, Tree>;
    Log.i("index: ${data.first}");
    Log.i("tree: ${data.second.toJson().toString()}");
    return DefaultTabController(
      initialIndex: data.first,
      length: data.second.children.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(data.second.name),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: data.second.children.map((e) => Tab(text: e.name)).toList(),
          ),
        ),
        body: TabBarView(
          children: data.second.children
              .map((e) => TreeDetailTabPage(cid: e.id))
              .toList(),
        ),
      ),
    );
  }
}
