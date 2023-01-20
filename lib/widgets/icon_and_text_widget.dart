import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/small_text_widget.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icondata;
  final String text;

  final Color iconColor;
  const IconAndTextWidget(
      {Key? key,
      required this.icondata,
      required this.text,

      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icondata,
          color: iconColor,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,

        )
      ],
    );
  }
}
