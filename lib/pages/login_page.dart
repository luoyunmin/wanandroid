import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/network/HttpUtil.dart';

import '../models/User.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({required this.onOptionsChange});

  final ValueChanged<User> onOptionsChange;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56),
      child: Column(
        children: [
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(local.go_to_register),
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
            onTap: () {},
          ),
          TextField(
            controller: _usernameController,
            decoration:
                InputDecoration(hintText: "", prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            controller: _passwordController,
            decoration:
                InputDecoration(hintText: "", prefixIcon: Icon(Icons.person)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: GestureDetector(
              onTap: () {
                _requestLogin(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: Text(
                  "登录",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _requestLogin(BuildContext context) async {
    User user = await HttpUtil.login(
        _usernameController.text, _passwordController.text);
    widget.onOptionsChange(user);
  }
}
