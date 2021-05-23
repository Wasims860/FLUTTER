import 'package:flutter/material.dart';
import '../utils/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, sizes) {
      var w = sizes.maxWidth;
      var h = sizes.maxHeight;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: h / 2.5,
          ),
          SizedBox(
            height: h / 5,
          ),
          Text(
            label,
            style: kLabelTextStyle,
          )
        ],
      );
    });
  }
}
