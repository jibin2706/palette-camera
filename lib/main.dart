import 'package:flutter/material.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var _primaryLight = Color(0xff016457);
    var _secondaryLight = Color(0xffe1e1e1);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palette Camera',
      theme: ThemeData(
        primaryColor: _primaryLight,
        appBarTheme: AppBarTheme(
            color: _secondaryLight,
            iconTheme: IconThemeData(color: _primaryLight)),
        buttonTheme: ButtonThemeData(
          buttonColor: _primaryLight,
          textTheme: ButtonTextTheme.primary,
        ),
        fontFamily: 'Fira Sans',
        textTheme: TextTheme(
          title: TextStyle(
              fontSize: 36.0, fontFamily: 'Sacramento', color: _primaryLight),
          headline: TextStyle(
              fontSize: 24, color: _primaryLight, fontWeight: FontWeight.bold),
          subhead: TextStyle(
              fontSize: 18, color: _primaryLight, fontWeight: FontWeight.bold),
          caption: TextStyle(fontSize: 14),
          body1: TextStyle(fontSize: 18),
        ),
      ),
      home: Home(),
    );
  }
}
