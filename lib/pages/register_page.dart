import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/network/HttpUtil.dart';

import '../models/User.dart';
import '../util/Log.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({required this.onOptionsChange});

  final ValueChanged<User> onOptionsChange;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _rePasswordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
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
                const Icon(Icons.arrow_circle_left_outlined),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(local.go_to_login),
                ),
              ],
            ),
            onTap: () {},
          ),
          TextField(
            controller: _usernameController,
            decoration:
            InputDecoration(
                hintText: "username", prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            controller: _passwordController,
            decoration:
            InputDecoration(
                hintText: "password", prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            controller: _rePasswordController,
            decoration:
            InputDecoration(hintText: "repassword", prefixIcon: Icon(Icons.person)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: GestureDetector(
              onTap: () {
                _requestRegister();
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
                  "注册",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _requestRegister() async {
    User user = await HttpUtil.register(_usernameController.text, _passwordController.text,
        _rePasswordController.text);
    widget.onOptionsChange(user);
  }
}
