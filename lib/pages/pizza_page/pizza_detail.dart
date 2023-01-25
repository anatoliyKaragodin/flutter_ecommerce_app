import 'package:flutter_ecommerce_app/library/all_library.dart';
import 'package:flutter_ecommerce_app/widgets/app_column.dart';

class PizzaDetail extends StatelessWidget {
  const PizzaDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Print screen height and width
    debugPrint(Dimensions.screenHeight.toString());
    debugPrint(Dimensions.screenWidth.toString());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.height10 * 35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/pizza1.jpg'))),
              )),
          Positioned(
              top: Dimensions.height10 * 4.5,
              left: Dimensions.width10 * 2,
              right: Dimensions.width10 * 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                  )
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.height10 * 35 - 20,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width10 * 2,
                  right: Dimensions.width10 * 2,
                  top: Dimensions.height10 * 2,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: 'Pizza 1',
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    BigText(text: 'Introduce'),
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(

        height: Dimensions.height10 * 12,
        padding: EdgeInsets.only(
            top: Dimensions.height10 * 3,
            bottom: Dimensions.height10 * 3,
            left: Dimensions.width10 * 2,
            right: Dimensions.width10 * 2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20 * 2),
          topRight: Radius.circular(Dimensions.radius20 * 2),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height10*2,
                bottom: Dimensions.height10*2,
                left: Dimensions.width10*2,
                right: Dimensions.width10*2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
              child: Row(
                children: [
                  Icon(Icons.remove),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: '0'),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height10*2,
                bottom: Dimensions.height10*2,
                left: Dimensions.width10*2,
                right: Dimensions.width10*2,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Theme.of(context).colorScheme.primary
              ),
              child: Row(
                children: [

                  BigText(text: '\$10 | Add to cart', color: Theme.of(context).colorScheme.onPrimary,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
