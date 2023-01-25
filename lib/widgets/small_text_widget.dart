import 'package:flutter_ecommerce_app/widgets/library/widgets_library.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  TextOverflow overflow;


  SmallText(
      {Key? key,
      this.color = Colors.black38,
      required this.text, this.overflow = TextOverflow.ellipsis,
      this.size = 0,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: size == 0 ? Dimensions.font20 * 0.6 : size),
    );
  }
}
