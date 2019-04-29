import 'package:flutter/material.dart';
import '../framework/navigation.dart';
import '../db/favorite.dart';
import 'setting.dart';


class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {

  static final FavoriteDB favoriteDB = new FavoriteDB();

  List<IconButton> _iconMenus(BuildContext context) {
    return [
      new IconButton(
        icon: new Icon(Icons.message),
        onPressed: () {
          Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("新消息")));
        },
      )
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        // see https://github.com/alibaba/flutter-go/blob/master/lib/widgets/components/Bar/SliverAppBar/demo.dart
        return <Widget>[
          SliverAppBar(
            snap: false,
            primary: true,
            forceElevated: false,
            automaticallyImplyLeading: true,
            leading: new IconButton(
              icon: new Icon(Icons.settings),
              onPressed: () {
                // dynamic navigation
                Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return new Setting();
                }));
              },
            ),
            actions: _iconMenus(context),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            titleSpacing: NavigationToolbar.kMiddleSpacing,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
              background: Image.asset(
                  'res/assets/profile_bg.jpg',
                  fit: BoxFit.fitWidth
              ),
            ),
          ),
        ];
      },
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: favoriteDB.getFavoriteList(),
        builder: (context, snapshot) {
          // if (snapshot.hasError) print(snapshot.error);
          List<Map<String, dynamic>> list = snapshot.data;
          // print("----favorite count:" + list.length.toString());
          return ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, int position) {
              Map item = list[position];
              return Card(
                child: ListTile(
                  title: Text(item['title']),
                  onTap: () {
                    NavigationChannel.pushWebRoute({
                      "title": item['title'].toString(),
                      "url": item['url'].toString()
                    });
                  },
                  onLongPress: () {
                    showDialog(context: context, builder: (_) =>
                        AlertDialog(
                          title: Text("确定删除[${item['title'].toString()}]文章吗?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('取消'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text('确认'),
                              onPressed: () {
                                favoriteDB.deleteFavorite(item['id']).then((
                                    ret) {
                                  String msg = ret > 0 ? "删除成功" : "删除失败";
                                  Scaffold.of(context).showSnackBar(
                                      new SnackBar(content: new Text(msg)));
                                  Navigator.of(context).pop();
                                });
                              },
                            ),
                          ],
                        ));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
