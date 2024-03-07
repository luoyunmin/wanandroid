import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanandroid/data/wanandroid_options.dart';
import 'package:wanandroid/models/Me.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/network/HttpUtil.dart';

import '../models/Resp.dart';
import '../models/User.dart';
import '../util/Log.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context);
    User? user = WanAndroidOptions.of(context).user;
    Widget loginWidget;
    if (user == null) {
      loginWidget = Padding(
        padding: EdgeInsets.only(top: 16),
        child: GestureDetector(
          child: Text("去登录"),
          onTap: () {
            Navigator.of(context).pushNamed("not_login");
          },
        ),
      );
    } else {
      loginWidget = Padding(
        padding: EdgeInsets.only(top: 16),
        child: GestureDetector(
          child: Text(user.username ?? ""),
          onTap: () {
            _requestLogout(() {
              WanAndroidOptions.update(
                  context, WanAndroidOptions.of(context).copyWith(user: null));
            });
          },
        ),
      );
    }
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
              loginWidget
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
      body: ListView(children: items),
    );
  }

  void _requestLogout(Function() callback) async {
    Resp<dynamic> resp = await HttpUtil.logout();
    if (resp.errorCode == 0) {
      var sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("user");
      callback.call();
    }
  }
}
