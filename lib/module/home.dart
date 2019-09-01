import 'package:flutter/material.dart';
import '../framework/webview.dart';

class Home extends StatelessWidget {

  final bool appBar;

  Home([this.appBar]);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: WebView('easy-team', 'https://www.yuque.com/easy-team', true)
    );
  }
}