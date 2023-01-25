import 'package:flutter_ecommerce_app/library/all_library.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text),
        SizedBox(
          height: Dimensions.height10,
        ),

        /// Comment section
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color:
                    Theme.of(context).colorScheme.primary,
                    size: Dimensions.iconSize10 * 1.5,
                  )),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: '1287'),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: 'comments')
          ],
        ),
        SizedBox(
          height: Dimensions.height10 * 2,
        ),

        /// Time and distance
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                iconData: Icons.circle_rounded,
                text: 'Normal',
                iconColor: ColorsUtil.iconColor1),
            IconAndTextWidget(
                iconData: Icons.location_on,
                text: '1.7 km',
                iconColor: ColorsUtil.iconColor2),
            IconAndTextWidget(
                iconData: Icons.access_time_rounded,
                text: '32 min',
                iconColor: ColorsUtil.iconColor3),
          ],
        )
      ],
    );
  }
}
