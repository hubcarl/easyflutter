import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PagerList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PagerListState();
}

class PagerListState extends State<PagerList> {
  ScrollController _scrollController = new ScrollController();
  List<int> listItems = List.generate(15, (i) => i);
  bool isLoading = false;

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
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("pager load");
        _getMoreData();
      }
    });
  }

  Future _getMoreData() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      List<int> newEntries = await httpRequest(listItems.length, listItems.length + 10);
      setState(() {
        listItems.addAll(newEntries);
        isLoading = false;
      });
    }
  }

  Future<List<int>> httpRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
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
//            NavigationChannel.pop({ 'msg': 'Flutter 关闭当前页面' });
//            if (Navigator.canPop(context)) {
//              Navigator.pop(context);
//            } else {
//              SystemNavigator.pop();
//            }
          },
        )
      ),
      body: new RefreshIndicator(
        child: ListView.builder(
          itemCount: listItems.length + 1,
          itemBuilder: (context, index) {
            if (index == listItems.length) {
              return new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Center(
                  child: new Opacity(
                    opacity: 1.0,
                    child: new CircularProgressIndicator(),
                  ),
                ),
              );
//              return Container(child:  Padding(
//                padding: EdgeInsets.all(20.0),
//                child: Center(
//                  child: Text("加载中……"),
//                ),
//              ),color: Colors.white);
            } else {
              return ListTile(title: Text("列表加载测试-$index"));
            }
          },
          controller: _scrollController,
        ),
        onRefresh: _pullRefresh,
      ),
    );
  }
}