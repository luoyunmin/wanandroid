import 'package:flutter/cupertino.dart';
import 'package:wanandroid/data/icons.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

enum BottomItem {
  home(icon: WanAndroidIcons.home),
  questions(icon: WanAndroidIcons.questions),
  architecture(icon: WanAndroidIcons.architecture),
  me(icon: WanAndroidIcons.me);

  const BottomItem({required this.icon});

  final IconData icon;

  String displayName(WanAndroidLocalizations localizations) {
    switch (this) {
      case BottomItem.home:
        return localizations.home;
      case BottomItem.questions:
        return localizations.questions;
      case BottomItem.architecture:
        return localizations.architecture;
      case BottomItem.me:
        return localizations.me;
    }
  }
}
