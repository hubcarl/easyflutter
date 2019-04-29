import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PullRefresh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PullRefreshState();
}

class PullRefreshState extends State<PullRefresh> {
  List<int> listItems = List.generate(10, (i) => i);

  Future<Null> _pullRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('pullRefresh');
      setState(() {
        listItems.clear();
        listItems = List.generate(20, (i) => i);
        return null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表加载测试"),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            SystemNavigator.pop(); // remove this activity from the stack
          }
        )
      ),
      body: new RefreshIndicator(
        child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("列表加载测试-$index"),
            );
          },
        ),
        onRefresh: _pullRefresh,
      ),
    );
  }
}