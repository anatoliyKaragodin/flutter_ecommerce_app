import 'dart:ui';

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
  // final List<Widget> images =
  // [];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        child: Carousel(
          itemBuilder: _buildPageItem,
        ));
  }

  Widget _buildPageItem(context, int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      double currentScale =
          1 - (_currentPageValue - index) * (1 - _scaleFactor);
      double currentTransformation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransformation, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      double currentScale =
          _scaleFactor + (_currentPageValue - index) * (1 - _scaleFactor);
      double currentTransformation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransformation, 0);
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

typedef OnCurrentItemChangedCallback = void Function(int currentItem);

class Carousel extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;

  const Carousel({super.key, required this.itemBuilder});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _controller;
  late int _currentPage;
  bool _pageHasChanged = false;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller = PageController(
      viewportFraction: .85,
      initialPage: _currentPage,
    );
  }

  @override
  Widget build(context) {
    var size = MediaQuery.of(context).size;
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          _pageHasChanged = true;
          _currentPage = value;
        });
      },
      controller: _controller,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      itemBuilder: (context, index) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          var result = _pageHasChanged ? _controller.page! : _currentPage * 1.0;

          // The horizontal position of the page between a 1 and 0
          var value = result - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);

          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * size.height,
              width: Curves.easeOut.transform(value) * size.width,
              child: child,
            ),
          );
        },
        child: widget.itemBuilder(context, index),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
