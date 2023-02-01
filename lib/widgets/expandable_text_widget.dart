import 'package:flutter_ecommerce_app/widgets/library/widgets_library.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalfText;
  late String secondHalfText;

  bool hiddenText = true;

  double textHeight = Dimensions.height10 * 20;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalfText = widget.text.substring(0, textHeight.toInt());
      secondHalfText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalfText = widget.text;
      secondHalfText = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalfText.isEmpty
          ? SmallText(size: Dimensions.font20 * 0.7, text: firstHalfText)
          : Column(
              children: [
                SmallText(
                    size: Dimensions.font20 * 0.7,
                    text: hiddenText
                        ? '$firstHalfText...'
                        : firstHalfText + secondHalfText),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText?'Show more':'Show less',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
