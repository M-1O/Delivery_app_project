import 'package:get/get.dart';

class Dimentions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

//dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 84.4 * 1.5;
  static double height20 = screenHeight / 42.2;

//dynamic width padding and margin
  static double width10 = screenWidth / 84.4;
  static double width15 = screenWidth / 84.4 * 1.5;
  static double width20 = screenWidth / 42.2;
  static double width30 = screenWidth / 42.2 * 1.5;

  static double font20 = screenHeight / 42.2;
  static double font12 = screenHeight / (42.2 * 20 / 12);

  static double readius15 = screenHeight / 56.2;
  static double readius20 = screenHeight / 42.2;
  static double raduis30 = screenHeight / 28.1;
}
