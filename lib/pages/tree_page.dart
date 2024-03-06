import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/network/HttpUtil.dart';
import 'package:wanandroid/widgets/architecture_item.dart';

import '../models/Tree.dart';

class TreePage extends StatefulWidget {
  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> with AutomaticKeepAliveClientMixin {
  final List<Tree> _data = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_data.isEmpty) {
      _requestTree();
    }
    return ListView.builder(
      itemBuilder: (context, index) => TreeItem(_data[index]),
      itemCount: _data.length,
    );
  }

  void _requestTree() async {
    List<Tree> result = await HttpUtil.getTree();
    setState(() {
      _data.insertAll(0, result);
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
