import 'package:flutter/material.dart';
import '../widget/SiteList.dart';
class Document extends StatefulWidget {

  final bool appBar;

  Document([this.appBar]);

  @override
  State<StatefulWidget> createState() => DocumentState();
}

class DocumentState extends State<Document> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: widget.appBar == false ? null : new AppBar(
        title: new Text("Document"),
        centerTitle: true,
      ),
      body: new Center(
        child: new SiteList('lib/config/doc.json')
      ),
    );
  }
}