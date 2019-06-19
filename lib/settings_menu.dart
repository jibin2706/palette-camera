import 'package:flutter/material.dart';

class SettingsMenu extends StatefulWidget {
  @override
  _SettingsMenuState createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  bool hex = false;
  bool rgb = false;
  bool hsl = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Settings",
                style: Theme.of(context).textTheme.headline,
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              IconButton(
                icon: Icon(Icons.close),
                tooltip: "Close Settings",
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Color Value Format",
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text(
                  "Formats to be displayed on color palette",
                  style: Theme.of(context).textTheme.caption,
                ),
                Row(
                  children: <Widget>[
                    Text("HEX"),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Checkbox(
                      value: hex,
                      onChanged: (value) => setState(() {
                            hex = value;
                          }),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("RGB"),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Checkbox(
                      value: rgb,
                      onChanged: (value) => setState(() {
                            rgb = value;
                          }),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("HSL"),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Checkbox(
                      value: hsl,
                      onChanged: (value) => setState(() {
                            hsl = value;
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "About",
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text(
                  "An simple app to generate color palette from images. \nIf you faced any issue, feel free to send an mail at jibin.thomas2706@gmail.com",
                  style: Theme.of(context).textTheme.body1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
