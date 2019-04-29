import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';

class WebviewTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WebviewTestState();
}

class WebviewTestState extends State<WebviewTest> {

//  final FlutterWebviewPlugin flutterWebViewPlugin = new FlutterWebviewPlugin();
//
//  final String url = 'https://flutter.io';
//
//  @override
//  void initState() {
//    super.initState();
//    flutterWebViewPlugin.launch(url);
//  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
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
      url: 'https://flutter.io',
      hidden: false,
      withZoom: false,
      withLocalStorage: true,
//      initialChild: Container(
//        color: Colors.redAccent,
//        child: const Center(
//          child: Text('Waiting.....'),
//        ),
//      ),
    );
  }
}