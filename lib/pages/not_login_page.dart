import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/data/wanandroid_options.dart';
import 'package:wanandroid/pages/login_page.dart';
import 'package:wanandroid/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import '../models/User.dart';

class NotLoginPage extends StatefulWidget {
  @override
  _NotLoginPageState createState() => _NotLoginPageState();
}

class _NotLoginPageState extends State<NotLoginPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var options = WanAndroidOptions.of(context);
    onOptionsChange(user) {
      _saveUser(user);
      WanAndroidOptions.update(context, options.copyWith(user: user));
      Navigator.of(context).pop();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Image.asset("images/launcher_icon.png"),
          Text(WanAndroidLocalizations.of(context)!.welcome_to_use),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                LoginPage(
                  onOptionsChange: onOptionsChange,
                ),
                RegisterPage(
                  onOptionsChange: onOptionsChange,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _saveUser(User user) async {
    var sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString("user",  jsonEncode(user));
  }
}
