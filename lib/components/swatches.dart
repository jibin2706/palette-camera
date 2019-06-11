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
              color: color,
              height: 40.0,
              width: MediaQuery.of(context).size.width-20,
            ),
          ),
        ],
//      ),
    );
  }
}
