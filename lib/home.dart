import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'tools.dart';
import 'news.dart';
import 'stats.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    Headlines(),
    Stats(),
    Tools(),
  ];

  List<String> _tabNames = [
    'Headlines',
    'Stats',
    'Tools',
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_tabNames.elementAt(_selectedIndex)),
        centerTitle: true,
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return FadeThroughTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
          );
        },
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        elevation: 8.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.newspaperVariantOutline),
            activeIcon: Icon(MdiIcons.newspaperVariant),
            title: Text('Headlines'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.pollBoxOutline),
            activeIcon: Icon(MdiIcons.pollBox),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.wrenchOutline),
            activeIcon: Icon(MdiIcons.wrench),
            title: Text('Tools'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
