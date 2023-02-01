import 'package:flutter_ecommerce_app/library/all_library.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;




  SmallText(
      {Key? key,
      this.color = Colors.black38,

      this.size = 0,
      this.height = 1.2, required this.text})
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
