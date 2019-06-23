import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './dashboard.dart';
import './favourite.dart';
import './image_palette.dart';
import './settings_menu.dart';

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
              title: Text(
                "Palette Camera",
                style: TextStyle(
                    fontFamily: 'Sacramento',
                    fontSize: 36,
                    letterSpacing: 2,
                    color: _primaryLight),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    _showSettings(context);
                  },
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
    if (index == 0) {
      pickImage(context, ImageSource.camera);
    }
  }

  void _showSettings(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SettingsMenu();
        });
  }
}

pickImage(BuildContext context, ImageSource source) async {
  var file = await ImagePicker.pickImage(
      source: source, maxHeight: 1980, maxWidth: 1020);
//    if picture is taken pass the image to next screen else do nothing
  if (await file.exists()) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagePalette(
              image: file,
            ),
      ),
    );
  }
}
