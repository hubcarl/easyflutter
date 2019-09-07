import 'package:flutter/material.dart';


class Template extends StatefulWidget {
  final bool appBar;

  Template([this.appBar]);

  @override
  State<StatefulWidget> createState() => TemplateState();
}

class TemplateState extends State<Template> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: new Scaffold(
        appBar: widget.appBar == false ? null: new AppBar(title: new Text("Template")),
        body: new Center(),
      ),
    );
  }
}
