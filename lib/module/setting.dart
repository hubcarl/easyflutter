import 'package:flutter/material.dart';
import '../test/pagerlist.dart';
import '../test/pullrefresh.dart';
import '../test/webview.dart';
import '../framework/navigation.dart';
import '../db/favorite.dart';
import 'package:flutter/services.dart';

class Setting extends StatefulWidget {

  final bool appBar;

  Setting([this.appBar]);

  @override
  State<StatefulWidget> createState() => SettingState();
}

class SettingState extends State<Setting> {
  static const MethodChannel methodChannel = MethodChannel('com.happy.message/notify');

  Future<dynamic> settingChannelHandler(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'getFlutterVersion':
        return '1.0.0';
      default:
    }
  }

  _showAlertDialog(BuildContext context, String title, String content) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('确认'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    methodChannel.setMethodCallHandler(this.settingChannelHandler);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: widget.appBar == false ? null : new AppBar(
        title: new Text("Setting"),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('列表下拉刷新'),
              onTap: () {
                NavigationChannel.pushRoute('test/pull').then((ret){
                  print("--pushRoute--:" + ret);
                  if (ret != 'success') {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return new PullRefresh();
                    }));
                  }
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('滑动分页加载'),
              onTap: () {
                NavigationChannel.pushRoute('test/pager').then((ret){
                  print("--pushRoute--:" + ret);
                  if (ret != 'success') {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return new PagerList();
                    }));
                  }
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.web),
              title: new Text('Webview页面加载'),
              onTap: () {
                NavigationChannel.pushRoute('test/web').then((ret){
                  print("--pushRoute--:" + ret);
                  if (ret != 'success') {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return new WebviewTest();
                    }));
                  }
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.pages),
              title: new Text('Native与Flutter跳转'),
              onTap: () {
                NavigationChannel.pushRoute('compare', { 'msg': 'Native与Flutter跳转测试' }).then((ret){
                  if (ret != 'success') {
                    showDialog(context: context, builder: (_) => _showAlertDialog(context, '信息', '非 Native Flutter 混合应用'));
                  }
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.pages),
              title: new Text('Native与Flutter通信'),
              onTap: () {
                NavigationChannel.pushRoute('native', { 'msg': 'Flutter 打开 Native 页面' }).then((ret){
                  if (ret != 'success') {
                    showDialog(context: context, builder: (_) => _showAlertDialog(context, '信息', '非 Native Flutter 混合应用'));
                  }
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.update),
              title: new Text('数据库测试'),
              onTap: () {
                FavoriteDB helper = new FavoriteDB();
                helper.initDb().then((db){
                  helper.getFavoriteList().then((rows){
                    List<Map> list = rows;
                    showDialog(context: context, builder: (_) => _showAlertDialog(context, '信息', '数据记录条数:' + list.length.toString()));
                  });
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.update),
              title: new Text('应用动态更新'),
              onTap: () {
                showDialog(context: context, builder: (_) => _showAlertDialog(context, '信息', '暂未实现, 研究中...'));
              },
            )
          ],
        ),
      ),
    );
  }
}