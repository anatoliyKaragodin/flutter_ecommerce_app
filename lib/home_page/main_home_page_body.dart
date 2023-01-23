import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/colors_util.dart';
import 'package:flutter_ecommerce_app/widgets/big_text_widget.dart';
import 'package:flutter_ecommerce_app/widgets/icon_and_text_widget.dart';
import 'package:flutter_ecommerce_app/widgets/small_text_widget.dart';

class MainHomePageBody extends StatefulWidget {
  const MainHomePageBody({Key? key}) : super(key: key);

  @override
  State<MainHomePageBody> createState() => _MainHomePageBodyState();
}

class _MainHomePageBodyState extends State<MainHomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;

        /// TODO: It's debug print
        // debugPrint('current page value:$_currentPageValue');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(context, position);
          }),
    );
  }

  Widget _buildPageItem(context, int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransformation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransformation, 0);

      /// TODO: It's debug print
      // debugPrint('CURRENT SCALE:$currentScale');
      // debugPrint(currentTransformation.toString());
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransformation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransformation, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransformation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransformation, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? Theme.of(context).colorScheme.secondaryContainer
                  : Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withOpacity(0.5),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pizza${index + 1}.jpg'))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 150,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Pizza ${index + 1}'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 15,
                                )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '4.5'),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '1287'),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: 'comments')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconAndTextWidget(
                          icondata: Icons.circle_rounded,
                          text: 'Normal',
                          iconColor: ColorsUtil.iconColor1),
                      IconAndTextWidget(
                          icondata: Icons.location_on,
                          text: '1.7 km',
                          iconColor: ColorsUtil.iconColor2),
                      IconAndTextWidget(
                          icondata: Icons.access_time_rounded,
                          text: '32 min',
                          iconColor: ColorsUtil.iconColor3),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
