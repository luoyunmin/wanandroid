import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(local.setting),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(local.follow_system),
            value: false,
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: Text(local.dark),
            value: false,
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: Text(local.bookmark_remind),
            subtitle: Text(local.bookmark_remind_desc),
            value: false,
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: Text(local.show_carousel),
            subtitle: Text(local.show_carousel_desc),
            value: false,
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            title: Text(local.show_top),
            subtitle: Text(local.show_top_desc),
            value: false,
            onChanged: (bool value) {},
          ),
          ListTile(
            title: Text(local.web_interceptor),
            subtitle: Text(local.web_interceptor_desc),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text("不拦截"), Icon(Icons.chevron_right)],
            ),
          ),
          ListTile(
            title: Text(local.clear_cache),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text("4.08M"), Icon(Icons.chevron_right)],
            ),
          ),
          ListTile(
            title: Text(local.update),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text("已是最新版"), Icon(Icons.chevron_right)],
            ),
          ),
          ListTile(
            title: Text(local.about_api),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text("当前版本1.0.0"), Icon(Icons.chevron_right)],
            ),
            onTap: (){
              Navigator.of(context).pushNamed("about");
            },
          ),
          ListTile(
            title: Text(local.privacy),
            trailing: Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}
