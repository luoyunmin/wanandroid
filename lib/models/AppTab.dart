import 'package:flutter/cupertino.dart';
import 'package:wanandroid/data/icons.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

enum AppTab {
  home(icon: WanAndroidIcons.home),
  questions(icon: WanAndroidIcons.questions),
  architecture(icon: WanAndroidIcons.architecture),
  me(icon: WanAndroidIcons.me);

  const AppTab({required this.icon});

  final IconData icon;

  String displayName(WanAndroidLocalizations localizations) {
    switch (this) {
      case AppTab.home:
        return localizations.home;
      case AppTab.questions:
        return localizations.questions;
      case AppTab.architecture:
        return localizations.architecture;
      case AppTab.me:
        return localizations.me;
    }
  }
}
