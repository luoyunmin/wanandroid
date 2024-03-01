import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/BottomItem.dart';
import 'package:wanandroid/routes/architecture_page.dart';
import 'package:wanandroid/routes/home_page.dart';
import 'package:wanandroid/routes/me_page.dart';
import 'package:wanandroid/routes/questions_page.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

class MainRoute extends StatefulWidget {
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: BottomItem.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: TabBar(
          overlayColor: MaterialStateProperty.all(Colors.transparent), // 没有点击效果
          indicatorPadding: EdgeInsets.zero,
          indicatorWeight: 0,
          indicator: const BoxDecoration(),
          controller: _tabController,
          tabs: BottomItem.values.map((e) =>
              Tab(text: e.displayName(local!), icon: Icon(e.icon))).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: getTabPage(context),
      ),
    );
  }

  List<Widget> getTabPage(BuildContext context) =>
      <Widget>[HomePage(), QuestionsPage(), ArchitecturePage(), MePage()];
}
