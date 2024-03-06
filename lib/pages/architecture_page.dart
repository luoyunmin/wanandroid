import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/ArchitectureTab.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';
import 'package:wanandroid/pages/tree_page.dart';
import 'package:wanandroid/pages/navi_page.dart';

class ArchitecturePage extends StatefulWidget {
  @override
  State<ArchitecturePage> createState() => _ArchitecturePageState();
}

class _ArchitecturePageState extends State<ArchitecturePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ArchitectureTab.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          dividerColor: Colors.transparent,
          dividerHeight: 0,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          // 没有点击效果
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorPadding: EdgeInsets.zero,
          indicatorWeight: 0,
          indicator: const BoxDecoration(),
          controller: _tabController,
          tabs: ArchitectureTab.values
              .map((e) => Text(
                    e.displayName(local!),
                    style: TextStyle(fontSize: 16),
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _getTabPage(context),
      ),
    );
  }

  List<Widget> _getTabPage(BuildContext context) =>
      <Widget>[TreePage(), NaviPage()];
}
