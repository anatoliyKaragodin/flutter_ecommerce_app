import 'package:flutter_ecommerce_app/widgets/library/widgets_library.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData iconData;
  final String text;

  final Color iconColor;
  const IconAndTextWidget(
      {Key? key,
      required this.iconData,
      required this.text,

      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: iconColor,
          size: Dimensions.iconSize10*2.4,
        ),
        SizedBox(
          width: Dimensions.height10/2,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
