import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';

class WebView extends StatefulWidget {
  final String title;
  final String url;
  final bool appBar;

  WebView(this.title, this.url, this.appBar);

  @override
  State<StatefulWidget> createState() => WebViewState();
}

class WebViewState extends State<WebView> {

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
        title: Text(widget.title),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }
        )
      ),
      url: widget.url,
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