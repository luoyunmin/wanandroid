import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/data/wanandroid_options.dart';
import 'package:wanandroid/pages/UnknownPage.dart';
import 'package:wanandroid/pages/about_page.dart';
import 'package:wanandroid/pages/favorites_page.dart';
import 'package:wanandroid/pages/not_login_page.dart';
import 'package:wanandroid/pages/search_page.dart';
import 'package:wanandroid/pages/setting_page.dart';
import 'package:wanandroid/pages/tree_detail_page.dart';
import 'package:wanandroid/pages/web_page.dart';
import 'package:wanandroid/util/Log.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext);

class Path {
  Path(this.path, this.isNeedLogin, this.builder);

  final String path;
  final bool isNeedLogin;
  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static final not_login_path =
      Path("not_login", false, (context) => NotLoginPage());

  static final un_konw_path =
      Path("unknown", false, (context) => UnknownPage());

  static List<Path> paths = [
    not_login_path,
    un_konw_path,
    Path("tree_detail", false, (context) => TreeDetailPage()),
    Path("setting", false, (context) => const SettingsPage()),
    Path("about", false, (context) => const AboutPage()),
    Path("search", false, (context) => SearchPage()),
    Path("favorites", true, (context) => FavoritesPage()),
    Path("web", false, (context) => WebPage()),
  ];

  static onGenerateRoute(RouteSettings setting) {

    return MaterialPageRoute(
        builder: (context) {
          var options = WanAndroidOptions.of(context);
          for (final path in paths) {
            if (path.path == setting.name) {
              // 如果页面需要登录，但是没有登录
              if (path.isNeedLogin && options.user == null) {
                return not_login_path.builder(context);
              }
              return path.builder(context);
            }
          }
          // 没有找到对应的路由，返回一个未知页面
          return un_konw_path.builder(context);
        },
        settings: setting);
  }
}
