import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/pages/login_page.dart';
import 'package:wanandroid/pages/register_page.dart';

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
              children: [LoginPage(), RegisterPage()],
            ),
          )
        ],
      ),
    );
  }
}
