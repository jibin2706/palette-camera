import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tinycolor/tinycolor.dart';

class Swatches extends StatelessWidget {
  const Swatches({this.generator});

  final PaletteGenerator generator;

  @override
  Widget build(BuildContext context) {
    if (generator == null || generator.colors.isEmpty) {
      return Container();
    }

    return Column(
      children: <Widget>[
        ColorBlock(
          label: 'Dominant',
          color: generator.dominantColor?.color,
        ),
        ColorBlock(
          label: 'Light Vibrant',
          color: generator.lightVibrantColor?.color,
        ),
        ColorBlock(
          label: 'Vibrant',
          color: generator.vibrantColor?.color,
        ),
        ColorBlock(
          label: 'Dark Vibrant',
          color: generator.darkVibrantColor?.color,
        ),
        ColorBlock(
          label: 'Light Muted',
          color: generator.lightMutedColor?.color,
        ),
        ColorBlock(
          label: 'Muted',
          color: generator.mutedColor?.color,
        ),
        ColorBlock(
          label: 'Dark Muted',
          color: generator.darkMutedColor?.color,
        ),
      ],
    );
  }
}

class ColorBlock extends StatefulWidget {
  const ColorBlock({this.color, this.label});

  final Color color;
  final String label;

  @override
  _ColorBlockState createState() => _ColorBlockState();
}

class _ColorBlockState extends State<ColorBlock> {
  bool _hslValue = false;
  bool _rgbValue = false;

  @override
  void initState() {
    super.initState();
    _getColorFormatPreferences();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.color == null) {
      return Container();
    }

    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[renderHEX(), renderRGB(), renderHSL()],
            ),
          ),
          color: widget.color,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }

  Widget renderHEX() {
    return Text(
      getHexFromColor(widget.color),
      style: TextStyle(
        color: getOppositeColor(widget.color),
        fontSize: 25,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget renderRGB() {
    if (_rgbValue == true) {
      return Text(
        getRgbFromColor(widget.color),
        style: TextStyle(
          color: getOppositeColor(widget.color),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      );
    }
    return Container();
  }

  Widget renderHSL() {
    if (_hslValue == true) {
      return Text(
        getHSLFromColor(widget.color),
        style: TextStyle(
          color: getOppositeColor(widget.color),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      );
    }
    return Container();
  }

  String getHexFromColor(Color color) {
    return "#" + color.toString().substring(10, 16).toUpperCase();
  }

  String getRgbFromColor(Color color) {
    int red = color.red;
    int green = color.green;
    int blue = color.blue;

    return 'RGB($red,$green,$blue)';
  }

  String getHSLFromColor(Color color) {
    String hue = HSLColor.fromColor(color).hue.toStringAsFixed(1);
    String saturation = HSLColor.fromColor(color).saturation.toStringAsFixed(1);
    String lightness = HSLColor.fromColor(color).lightness.toStringAsFixed(1);

    return 'HSL($hue, $saturation, $lightness)';
  }

  Color getOppositeColor(Color color) {
    if (TinyColor(color).isDark()) return Colors.white;
    return Colors.black;
  }

  _getColorFormatPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _rgbValue = (prefs.getBool('rgb')) ?? false;
      _hslValue = (prefs.getBool('hsl')) ?? false;
    });
  }
}
