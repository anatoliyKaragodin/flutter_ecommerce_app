import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      this.color = Colors.black38,
      required this.text,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: size == 0 ? Dimensions.font20 * 0.6 : size),
    );
  }
}
