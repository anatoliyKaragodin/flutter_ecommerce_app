import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/home_page/main_home_page_body.dart';
import 'package:flutter_ecommerce_app/widgets/big_text_widget.dart';
import 'package:flutter_ecommerce_app/widgets/small_text_widget.dart';

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
              margin: EdgeInsets.only(top: 40, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
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
                          SmallText(text: 'Moscow',
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),),
                        Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          /// Body
          MainHomePageBody(),
        ],
      ),
    );
  }
}
