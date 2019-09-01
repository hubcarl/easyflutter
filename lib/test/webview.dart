import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_webview/flutter_native_webview.dart';

class WebviewTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WebviewTestState();
}

class WebviewTestState extends State<WebviewTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Webview页面加载"),
          centerTitle: true,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                SystemNavigator.pop(); // remove this activity from the stack
              }
          )
        ),
        body: NativeWebView("https://pub.dev/"),
      );
  }
}