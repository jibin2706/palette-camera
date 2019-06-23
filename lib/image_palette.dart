import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';

import 'components/swatches.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Palette Camera',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 1000,
          child: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        resizeToAvoidBottomPadding: false,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.file(
                    widget.image,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            FutureBuilder(
                future: getPalette(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData)
                    return Swatches(
                      generator: snapshot.data,
                    );
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }

  getPalette() async {
    var image = await load(widget.image.path);
    return PaletteGenerator.fromImage(image);
  }

  Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}
