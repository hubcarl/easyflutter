import 'package:flutter/material.dart';
import 'module/home.dart';
import 'module/find.dart';
import 'module/github.dart';
import 'module/document.dart';
import 'module/profile.dart';
import 'module/setting.dart';
import 'module/about.dart';
import 'test/pagerlist.dart';
import 'test/pullrefresh.dart';
import 'test/webview.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF008577),
      ),
      home: MainApp(title: 'easy-team'),
      routes: <String, WidgetBuilder> {
        'home': (BuildContext context) => new Home(false),
        'github': (BuildContext context) => new GitHub(),
        'document': (BuildContext context) => new Document(),
        'find': (BuildContext context) => new Find(false),
        'profile': (BuildContext context) => new Profile(),
        'setting': (BuildContext context) => new Setting(false),
        'about': (BuildContext context) => new About(),
        'test/pager': (BuildContext context) => new PagerList(),
        'test/pull': (BuildContext context) => new PullRefresh(),
        'test/web': (BuildContext context) => new WebviewTest(),
      },
      onGenerateRoute: (settings) {
        print('--name' + settings.name);
        print(settings.arguments);
      }
    );
  }
}

class MainApp extends StatefulWidget {
  MainApp ({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    Home(),
    GitHub(),
    Find(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.code), title: Text('GitHub')),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('Learning')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),

    );
  }
}
