import 'package:flutter/material.dart';
import 'package:flutter_native_webview/flutter_native_webview.dart';

class WebView extends StatefulWidget {
  final String title;
  final String url;
  final bool appBar;

  WebView(this.title, this.url, this.appBar);

  @override
  State<StatefulWidget> createState() => WebViewState();
}

class WebViewState extends State<WebView> {

  @override
   Widget build(BuildContext context) {
    return Scaffold(
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
        body: NativeWebView(widget.url),
      );
  }
}