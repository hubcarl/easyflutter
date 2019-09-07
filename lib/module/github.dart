import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/SiteList.dart';

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
          child: SiteList('lib/config/github.json')
         ),
      );
  }
}