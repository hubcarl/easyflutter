import 'dart:convert';
import 'package:flutter/material.dart';
import '../framework/webview.dart';
import '../framework/navigation.dart';

class SiteList extends StatefulWidget {
  final String asset;

  SiteList(this.asset);

  @override
  State<StatefulWidget> createState() => SiteListState();
}

class SiteListState extends State<SiteList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('--widget.asset' + widget.asset);
    return FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString(widget.asset),
              builder: (context, snapshot){
                var data = jsonDecode(snapshot.data.toString());
                var list = data['list'];
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, int index){
                      Map item = list[index];
                      var name = item['name'].toString();
                      var title = item['title'].toString();
                      var url = item['url'].toString();
                      return ListTile(
                          leading: new Icon(Icons.list),
                          title: Text(title),
                          onTap: () {
                            NavigationChannel.pushWebRoute({"title": name, "url": url }).then((ret){
                              print("--pushRoute--:" + ret);
                              if (ret != 'success') {
                                Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                                    (BuildContext context, Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return new WebView(name, url, true);
                                }));
                              }
                            });
                          }
                      );
                    }
                );
              }
          );
  }
}
