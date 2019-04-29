import 'package:flutter/material.dart';
import 'dart:convert';
import '../framework/navigation.dart';

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
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('lib/config/doc.json'),
          builder: (context, snapshot){
            var docs = jsonDecode(snapshot.data.toString());
            var list = docs['list'];
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, int index){
                Map item = list[index];
                return ListTile(
                  leading: new Icon(Icons.list),
                  title: Text(item['title']),
                  onTap: () {
                    NavigationChannel.pushWebRoute({"title": item['title'].toString(), "url": item['url'].toString()});
                  }
                );
              }
            );
          }
        )
      ),
    );
  }
}