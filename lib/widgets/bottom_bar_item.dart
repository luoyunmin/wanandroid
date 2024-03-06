import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/AppTab.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

class BottomBarItem extends StatefulWidget {
  final AppTab data;

  BottomBarItem(this.data) : super(key: ValueKey(data));

  @override
  _BottomBarItemState createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<BottomBarItem> {
  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context);
    return Center(
      child: Column(
        children: <Widget>[
          Icon(widget.data.icon),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text(widget.data.displayName(local!),
            ),
          ),
        ],
      ),
    );
  }
}
