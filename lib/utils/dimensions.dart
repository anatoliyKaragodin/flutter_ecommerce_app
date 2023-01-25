import 'package:get/get.dart';

/// Dynamic size of UI elements
class Dimensions {
  /// Get screen size
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  /// Dynamic sizes
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  /// Height
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.2;

  /// Width
  static double width10 = screenWidth / 36;

  /// Other sizes
  static double font20 = screenHeight / 42.2;
  static double radius20 = screenHeight / 42.2;
  static double iconSize10 = screenHeight / 84.4;
}
