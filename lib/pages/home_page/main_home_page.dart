import 'package:flutter_ecommerce_app/library/all_library.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height10 * 4, bottom: Dimensions.height10*1.5),
              padding: EdgeInsets.only(
                  left: Dimensions.width10 * 2,
                  right: Dimensions.width10 * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Russia',
                        color: Theme.of(context).primaryColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Moscow',
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5),
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width10 * 4.5,
                      height: Dimensions.height10 * 4.5,
                      child: Icon(Icons.search, color: Colors.white),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20 - 5),
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),

          /// Body
          Expanded(child: SingleChildScrollView(child: MainHomePageBody())),
        ],
      ),
    );
  }
}
