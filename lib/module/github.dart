import 'package:flutter/material.dart';
import 'dart:convert';
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
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('lib/config/github.json'),
              builder: (context, snapshot){
                var github = jsonDecode(snapshot.data.toString());
                var list = github['list'];
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, int index){
                      Map item = list[index];
                      var title = item['title'].toString();
                      var url = item['url'].toString();
                      return ListTile(
                          leading: new Icon(Icons.list),
                          title: Text(title),
                          onTap: () {
                            NavigationChannel.pushWebRoute({"title": title, "url": url }).then((ret){
                              print("--pushRoute--:" + ret);
                              if (ret != 'success') {
                                Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                                    (BuildContext context, Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return new WebView(title, url, true);
                                }));
                              }
                            });
                          }
                      );
                    }
                );
              }
          )
         ),
      );
  }
}