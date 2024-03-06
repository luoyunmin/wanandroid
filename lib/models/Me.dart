import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/data/icons.dart';

enum Me {
  credit(icon: WanAndroidIcons.credit), // 我的积分
  share(icon: WanAndroidIcons.share), //我的分享
  favorites(icon: WanAndroidIcons.favorites), //我的收藏
  bookmark(icon: WanAndroidIcons.bookmark), // 我的书签
  history(icon: WanAndroidIcons.history), // 阅读历史
  opensource(icon: WanAndroidIcons.opensource), //开源项目
  about(icon: WanAndroidIcons.about), //关于作者
  setting(icon: WanAndroidIcons.setting); //系统设置

  const Me({required this.icon});

  final IconData icon;

  String displayName(WanAndroidLocalizations local) {
    switch (this) {
      case Me.credit:
        return local.credit;
      case Me.share:
        return local.share;
      case Me.favorites:
        return local.favorites;
      case Me.bookmark:
        return local.bookmark;
      case Me.history:
        return local.history;
      case Me.opensource:
        return local.opensource;
      case Me.about:
        return local.about;
      case Me.setting:
        return local.setting;
    }
  }
}
