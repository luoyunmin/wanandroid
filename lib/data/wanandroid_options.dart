import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanandroid/network/HttpUtil.dart';
import 'package:wanandroid/util/StringUtil.dart';

import '../models/User.dart';

class WanAndroidOptions {
  const WanAndroidOptions({
    required this.themeMode,
    required Locale? locale,
    required User? user,
  })  : _locale = locale,
        _user = user;

  final ThemeMode themeMode;
  final Locale? _locale;
  final User? _user;

  User? get user => _user;

  Locale? get locale => _locale;

  static WanAndroidOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, WanAndroidOptions newOptions) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.updateModel(newOptions);
  }

  WanAndroidOptions copyWith(
      {ThemeMode? themeMode, Locale? locale, User? user}) {
    return WanAndroidOptions(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
        user: user);
  }
}

class _ModelBindingScope extends InheritedWidget {
  const _ModelBindingScope(
      {required this.modelBindingState, required super.child});

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  const ModelBinding(
      {super.key, required this.initialModel, required this.child});

  final WanAndroidOptions initialModel;
  final Widget child;

  @override
  State<ModelBinding> createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  late WanAndroidOptions currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
    _loadUser();
    HttpUtil.init();
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(modelBindingState: this, child: widget.child);
  }

  void updateModel(WanAndroidOptions newModel) {
    if (newModel != currentModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  void _loadUser() async {
    var sharedPreference = await SharedPreferences.getInstance();
    var userStr = sharedPreference.getString("user");
    if (!StringUtil.isEmpty(userStr)) {
      User user = User.fromJson(jsonDecode(userStr!));
      updateModel(currentModel.copyWith(user: user));
    }
  }
}
