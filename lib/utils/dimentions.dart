import 'package:get/get.dart';

class Dimentions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

//dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = height10 * 1.5;
  static double height20 = height10 * 2;
  static double height30 = height10 * 3;
  static double height45 = height10 * 4.5;

//dynamic width padding and margin
  static double width10 = screenWidth / 84.4;
  static double width15 = width10 * 1.5;
  static double width20 = width10 * 2;
  static double width30 = width10 * 3;

  static double font20 = screenHeight / 42.2;
  static double font12 = screenHeight / (42.2 * 20 / 12);

  static double radius10 = screenHeight / 84.4;
  static double radius15 = radius10 * 1.5;
  static double radius20 = radius10 * 2;
  static double raduis30 = radius10 * 3;
}
