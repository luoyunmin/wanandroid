import 'package:flutter/material.dart';

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

  static WanAndroidOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.currentModel;
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
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(modelBindingState: this, child: widget.child);
  }
}
