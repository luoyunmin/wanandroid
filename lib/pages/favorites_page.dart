import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var local = WanAndroidLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(local.favorites),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Favorites Page"),
      ),
    );
  }
}
