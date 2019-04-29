import 'package:flutter/material.dart';
import '../framework/webview.dart';
import '../framework/navigation.dart';
import 'package:flutter/services.dart';

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
        child: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('Flutter-移动UI框架'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : 'Flutter', 'url' : 'https://flutterchina.club/' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('Eggjs-企业级 Node.js 框架'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : 'Eggjs', 'url' : 'https://eggjs.org/zh-cn/index.html' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('Webpack-JavaScript模块打包工具'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : 'Webpack', 'url' : 'https://www.webpackjs.com' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('React-构建用户界面JavaScript库'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : 'React', 'url' : 'https://react.docschina.org' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('Vue-构建用户界面的渐进式框架'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : 'Vue', 'url' : 'https://cn.vuejs.org/index.html' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('AlloyTeam 前端技术博客'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : 'AlloyTeam前端技术博客', 'url' : 'http://www.alloyteam.com' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('淘宝前端技术博客'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : '淘宝前端技术博客', 'url' : 'http://taobaofed.org/' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('美团前端技术博客'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : '美团前端技术博客', 'url' : 'https://tech.meituan.com/' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('美团前端技术博客'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : '美团前端技术博客', 'url' : 'https://tech.meituan.com/' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('基础技术教程'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : '基础技术教程', 'url' : 'http://www.runoob.com/' });
              },
            ),
            new ListTile(
              leading: new Icon(Icons.list),
              title: new Text('easywebpack 专栏'),
              onTap: () {
                NavigationChannel.pushWebRoute({ 'title' : 'easywebpack 专栏', 'url' : 'https://zhuanlan.zhihu.com/easywebpack' });
              },
            ),
          ],
        ),
      ),
    );
  }
}