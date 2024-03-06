import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wanandroid/common/Global.dart';
import 'package:wanandroid/data/wanandroid_options.dart';
import 'package:wanandroid/network/HttpUtil.dart';
import 'package:wanandroid/pages/main_page.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/router.dart';
import 'package:wanandroid/wanandroid_theme_data.dart';

void main() {
  HttpUtil.init();
  runApp(const MyApp());
  Global.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: const WanAndroidOptions(
        themeMode: ThemeMode.system, locale: null, user: null,),
      child: Builder(
        builder: (context) {
          var options = WanAndroidOptions.of(context);
          return MaterialApp(
            themeMode: options.themeMode,
            theme: WanAndroidThemeData.lightThemeData,
            darkTheme: WanAndroidThemeData.darkThemeData,
            supportedLocales: const [Locale("zh"), Locale("en")],
            localizationsDelegates: const [
              WanAndroidLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate
            ],
            localeListResolutionCallback: (locale, supportLocals) {

            },
            onGenerateRoute: (setting) =>
                RouteConfiguration.onGenerateRoute(setting),
            home: MainPage(),
          );
        },
      ),
    );
  }
}
