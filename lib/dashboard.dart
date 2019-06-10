import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import './image_palette.dart';

class DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 25, top: 25),
            child: SvgPicture.asset("assets/logo.svg", height: 180),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CameraImagePickerButton()),
          Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: GalleryImagePickerButton()),
        ],
      ),
    );
  }
}

class CameraImagePickerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          pickImage(context, ImageSource.camera);
        },
        padding: EdgeInsets.all(10),
        child: Container(
          width: 220,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(Icons.camera),
              ),
              Expanded(
                  flex: 100,
                  child: Center(
                    child: Text("Take Photo"),
                  )),
            ],
          ),
        ));
  }
}

class GalleryImagePickerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            pickImage(context, ImageSource.gallery);
          },
          padding: EdgeInsets.all(10),
          child: Container(
            width: 220,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(Icons.photo_library),
                ),
                Expanded(
                  flex: 100,
                  child: Center(
                    child: Text("Open From Gallery"),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

pickImage(BuildContext context, ImageSource source) async {
  var file = await ImagePicker.pickImage(source: source);
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
