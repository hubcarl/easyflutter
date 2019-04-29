import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class About extends StatelessWidget {
  final bool appBar;

  About([this.appBar]);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: this.appBar == false ? null : new AppBar(
        title: new Text("关于"),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              SystemNavigator.pop(); // remove this activity from the stack
            }
        )
      ),
      body: new Center(
        child: new Text("Flutter About Page"),
      ),
    );
  }
}