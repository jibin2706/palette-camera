import 'package:flutter/material.dart';

import './dashboard.dart';
import './favourite.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    FavouriteTab(),
    DashboardTab(),
    FavouriteTab()
  ];

  @override
  Widget build(BuildContext context) {
    var _primaryLight = Color(0xff016457);
    var _secondaryLight = Color(0xffe1e1e1);

    return Scaffold(
        body: Stack(
          children: <Widget>[
            AppBar(
              centerTitle: true,
              title: Text("Palette Camera",
                  style: TextStyle(
                    fontFamily: 'Sacramento',
                    fontSize: 36,
                    letterSpacing: 2,
                    color: _primaryLight
                  )),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => {},
                ),
              ],
            ),
            _children[_currentIndex]
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          backgroundColor: _secondaryLight,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.camera), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: SizedBox.shrink()),
          ],
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
