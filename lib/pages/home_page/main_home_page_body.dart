import 'package:flutter_ecommerce_app/library/all_library.dart';
import 'package:flutter_ecommerce_app/widgets/app_column.dart';

class MainHomePageBody extends StatefulWidget {
  const MainHomePageBody({Key? key}) : super(key: key);

  @override
  State<MainHomePageBody> createState() => _MainHomePageBodyState();
}

class _MainHomePageBodyState extends State<MainHomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

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
    /// Print screen height and width
    debugPrint(Dimensions.screenHeight.toString());
    debugPrint(Dimensions.screenWidth.toString());
    return Column(
      children: [
        /// Carousel section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 8,
              itemBuilder: (context, position) {
                return _buildPageItem(context, position);
              }),
        ),

        /// Dots indicator
        DotsIndicator(
          dotsCount: 8,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: Size.square(Dimensions.iconSize10 * 0.9),
            activeSize:
                Size(Dimensions.iconSize10 * 1.8, Dimensions.iconSize10 * 0.9),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius20 / 4)),
          ),
        ),

        /// Popular text
        SizedBox(height: Dimensions.height10 * 3),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width10 * 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(height: Dimensions.height10),
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width10 / 2,
                    right: Dimensions.width10 / 2,
                    bottom: Dimensions.height10 * 0.3),
                child: BigText(
                    text: '.', color: Theme.of(context).colorScheme.onSurface),
              ),
              SizedBox(height: Dimensions.height10),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height10 * 0.3),
                child: SmallText(text: 'Pizza paring'),
              )
            ],
          ),
        ),

        /// List of food and images
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width10 * 2,
                    right: Dimensions.width10 * 2,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    /// Image section
                    Container(
                      width: Dimensions.width10*10,
                      height: Dimensions.width10*10,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Theme.of(context).colorScheme.onBackground,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/pizza${index + 1}.jpg'))),
                    ),

                    /// Text container
                    Expanded(
                      child: Container(
                        height: Dimensions.height10*10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20)),
                            color:
                                Theme.of(context).colorScheme.onBackground),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: 'Pizza ${index+1}'),
                              SizedBox(height: Dimensions.height10),
                              SmallText(text: 'text'),
                              SizedBox(height: Dimensions.height10),
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
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
      ],
    );
  }

  /// Carousel
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
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20 * 1.5),
              // color: index.isEven
              //     ? Theme.of(context).colorScheme.secondaryContainer
              //     : Theme.of(context)
              //         .colorScheme
              //         .secondaryContainer
              //         .withOpacity(0.5),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pizza${index + 1}.jpg'))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10 * 3,
                right: Dimensions.width10 * 3,
                bottom: Dimensions.height10 * 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Theme.of(context).colorScheme.onBackground,
                boxShadow: [
                  BoxShadow(
                      color:
                          Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                      blurRadius: Dimensions.radius20 / 4,
                      offset: Offset(0, Dimensions.height10/2)),
                  BoxShadow(
                      color: Theme.of(context).colorScheme.onBackground,
                      offset: Offset(-Dimensions.width10 / 2, 0)),
                  BoxShadow(
                      color: Theme.of(context).colorScheme.onBackground,
                      offset: Offset(Dimensions.width10 / 2, 0))
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10*1.5,
                  right: Dimensions.width10*1.5,
                  left: Dimensions.width10*1.5),
              child: AppColumn(text: 'Pizza 1',),
            ),
          ),
        ),
      ]),
    );
  }
}
