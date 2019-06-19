import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

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

class ColorBlock extends StatelessWidget {
  const ColorBlock({this.color, this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (color == null) {
      return Container();
    }

    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Text(
                getHexFromColor(color),
                style: TextStyle(
                    color: getOppositeColor(color),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
            color: color,
            height: 70.0,
            width: MediaQuery.of(context).size.width - 20,
          ),
        ),
      ],
    );
  }

  String getHexFromColor(Color color) {
    return "#" + color.toString().substring(10, 16).toUpperCase();
  }

  Color getOppositeColor(Color color) {
    if (TinyColor(color).isDark()) return Colors.white;
    return Colors.black;
  }
}
