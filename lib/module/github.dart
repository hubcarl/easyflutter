import 'package:flutter/material.dart';
import '../framework/webview.dart';
import '../framework/navigation.dart';
import 'package:flutter/services.dart';

class GitHub extends StatefulWidget {

  final bool appBar;

  GitHub([this.appBar]);

  @override
  State<StatefulWidget> createState() => GitHubState();
}

class GitHubState extends State<GitHub> {
  static const MethodChannel methodChannel = MethodChannel('com.happy.message/notify');

  Future<dynamic> settingChannelHandler(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'getFlutterVersion':
        return '1.0.0';
      default:
    }
  }

  _showAlertDialog(String title, String content) {
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
        title: new Text("GitHub"),
        centerTitle: true,
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('easy-team'),
              onTap: () {
                NavigationChannel.pushRoute('web', { 'title' : 'easy-team', 'url' : 'https://github.com/easy-team' }).then((ret){
                  print("--pushRoute--:" + ret);
                  if (ret != 'success') {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return new WebView('easy-team', 'https://github.com/easy-team', true);
                    }));
                  }
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('Eggjs'),
              onTap: () {
                NavigationChannel.pushRoute('web', { 'title' : 'Eggjs', 'url' : 'https://github.com/eggjs' }).then((ret){
                  print("--pushRoute--:" + ret);
                  if (ret != 'success') {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return new WebView('Eggjs', 'https://github.com/eggjs', true);
                    }));
                  }
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('Webpack'),
              onTap: () {
                NavigationChannel.pushRoute('web', { 'title' : 'Webpack', 'url' : 'https://github.com/webpack' }).then((ret){
                  print("--pushRoute--:" + ret);
                  if (ret != 'success') {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return new WebView('Webpack', 'https://github.com/webpack', true);
                    }));
                  }
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('Flutter'),
              onTap: () {
                NavigationChannel.pushRoute('web', { 'title' : 'Flutter', 'url' : 'https://github.com/flutter' }).then((ret){
                  print("--pushRoute--:" + ret);
                  if (ret != 'success') {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return new WebView('Flutter', 'https://github.com/flutter', true);
                    }));
                  }
                });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('Ant Design'),
              onTap: () {
                NavigationChannel.pushRoute('web', { 'title' : 'Ant Design', 'url' : 'https://github.com/ant-design/' }).then((ret){
                  print("--pushRoute--:" + ret);
                  if (ret != 'success') {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return new WebView('Ant Design', 'https://github.com/ant-design/', true);
                    }));
                  }
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}