import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/BottomItem.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

class BottomBarItem extends StatefulWidget {
  final BottomItem data;

  const BottomBarItem(this.data);

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
                padding: EdgeInsets.all(6),
                child: Text(widget.data.displayName(local!)),
            ),
          ],
        )
    );
  }
}
