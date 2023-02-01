import 'package:flutter_ecommerce_app/widgets/library/widgets_library.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundColor = Colors.white70,
      this.iconColor = Colors.black45,
      this.size = 40, this.iconSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size:iconSize ,
      ),
    );
  }
}
