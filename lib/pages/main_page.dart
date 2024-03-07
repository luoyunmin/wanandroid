import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/AppTab.dart';
import 'package:wanandroid/pages/architecture_page.dart';
import 'package:wanandroid/pages/home_page.dart';
import 'package:wanandroid/pages/me_page.dart';
import 'package:wanandroid/pages/questions_page.dart';
import 'package:wanandroid/widgets/bottom_bar_item.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

import '../data/wanandroid_options.dart';
import '../models/User.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late List<Widget> tabPages;

  @override
  void initState() {
    super.initState();
    tabPages = <Widget>[
      HomePage(),
      QuestionsPage(),
      ArchitecturePage(),
      MePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    // var local = WanAndroidLocalizations.of(context)!;
    return DefaultTabController(
      length: tabPages.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 64,
          padding: const EdgeInsets.only(top: 8),
          child: TabBar(
            // 没有点击效果
            dividerColor: Colors.transparent,
            unselectedLabelColor: Colors.black12,
            labelColor: Colors.blue,
            indicatorPadding: EdgeInsets.zero,
            indicatorWeight: 0,
            indicator: const BoxDecoration(),
            tabs: AppTab.values.map((e) => BottomBarItem(e)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabPages,
        ),
      ),
    );
  }
}
