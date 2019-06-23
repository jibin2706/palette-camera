import 'package:flutter/material.dart';

class FavouriteTab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palette Camera',
      home: Scaffold(
        body: Center(
          child: Text(
            "favourite page",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}
