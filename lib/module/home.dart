import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Home extends StatelessWidget {

  final bool appBar;

  Home([this.appBar]);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
          child: new WebviewScaffold(
            appBar: this.appBar == false ? null : new AppBar(
              title: new Text("easy-team"),
              centerTitle: true,
            ),
            url: 'https://www.yuque.com/easy-team',
            hidden: false,
            withZoom: false,
            withLocalStorage: true,
          ),
        )
    );
  }
}