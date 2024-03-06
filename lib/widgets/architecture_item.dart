import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/Navi.dart';

import '../models/Pair.dart';
import '../models/Tree.dart';

class TreeItem extends StatelessWidget {
  final Tree data;

  TreeItem(this.data) : super(key: ValueKey(data.id));

  @override
  Widget build(BuildContext context) {
    List.generate(data.children.length, (index) => GestureDetector());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.name),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 10,
              runAlignment: WrapAlignment.start,
              runSpacing: 10,
              children: List.generate(
                data.children.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("tree_detail",
                        arguments: Pair(first: index, second: data));
                  },
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 12),
                      child: Text(
                        data.children[index].name,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NaviItem extends StatelessWidget {
  final Navi data;

  NaviItem(this.data) : super(key: ValueKey(data.cid));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.name),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 10,
              runAlignment: WrapAlignment.start,
              runSpacing: 10,
              children: data.articles
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("web", arguments: e.link);
                      },
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 12),
                            child:
                                Text(e.title, style: TextStyle(fontSize: 14))),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
