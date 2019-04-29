import 'package:flutter/material.dart';
import '../test/pagerlist.dart';
import '../test/pullrefresh.dart';
import '../test/webview.dart';
import '../framework/navigation.dart';

class TestSetting extends StatelessWidget {
  final bool appBar;

  TestSetting([this.appBar]);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: this.appBar == false ? null : new AppBar(
        title: new Text("Setting"),
        centerTitle: true,
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('列表下拉刷新'),
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return new PullRefresh();
                }));
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('滑动分页加载'),
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return new PagerList();
                }));
              },
            ),
            new ListTile(
              leading: new Icon(Icons.web),
              title: new Text('Webview页面加载'),
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return new WebviewTest();
                }));
              },
            ),
            new ListTile(
              leading: new Icon(Icons.update),
              title: new Text('应用动态更新'),
            ),
            new ListTile(
              leading: new Icon(Icons.pages),
              title: new Text('打开 Native 页面'),
              onTap: () {
                NavigationChannel.pushRoute('native/about', { 'msg': 'Flutter 打开 Native 页面' });
              },
            ),
          ],
        ),
      ),
    );
  }
}