import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/Navi.dart';

import '../network/HttpUtil.dart';
import '../widgets/architecture_item.dart';

class NaviPage extends StatefulWidget {
  @override
  _NaviPageState createState() => _NaviPageState();
}

class _NaviPageState extends State<NaviPage>
    with AutomaticKeepAliveClientMixin {
  final List<Navi> _data = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_data.isEmpty) {
      _requestNavi();
    }
    return ListView.builder(
      itemBuilder: (context, index) => NaviItem(_data[index]),
      itemCount: _data.length,
    );
  }

  void _requestNavi() async {
    List<Navi> result = await HttpUtil.getNavi();
    setState(() {
      _data.clear();
      _data.insertAll(0, result);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
