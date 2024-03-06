import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/common/Global.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(local.about_api),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            heightFactor: 1.5,
            child: Column(
              children: [
                Image.asset('images/launcher_icon.png'),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                      "${Global.packageInfo.version}(${Global.packageInfo.buildNumber})"),
                )
              ],
            ),
          ),
          ListTile(
            leading: Text(
              local.official_website,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: Text(local.website_content),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: Text(local.project_source),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: Text(local.apply_for_closed_beta_test),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
