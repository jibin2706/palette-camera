import 'dart:io';

import 'package:flutter/material.dart';

class ImagePalette extends StatefulWidget {
  final File image;

  ImagePalette({key, this.image});

  @override
  _ImagePaletteState createState() => _ImagePaletteState();
}

class _ImagePaletteState extends State<ImagePalette> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palette Camera',
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: 1000,
                child: Image.file(
                  widget.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text('helloo'),
            ),
          ],
        ),
      ),
    );
  }
}
