import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/Me.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context);
    Widget header = Container(
        color: Colors.blue,
        child: Center(
          heightFactor: 1.5,
          child: Column(
            children: [
              Image.asset(
                "images/avatar_default.png",
                height: 100,
                width: 100,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: GestureDetector(
                  child: Text("去登录"),
                  onTap: () {
                    Navigator.of(context).pushNamed("not_login");
                  },
                ),
              )
            ],
          ),
        ));
    var items = <Widget>[];
    items.add(header);
    items.addAll(Me.values
        .map(
          (e) => ListTile(
            leading: Icon(e.icon),
            title: Text(e.displayName(local!)),
            trailing: const Icon(Icons.chevron_right_outlined),
            onTap: () {
              Navigator.of(context).pushNamed(e.name);
            },
          ),
        )
        .toList());
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: items),
    );
  }
}
