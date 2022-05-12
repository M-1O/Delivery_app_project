import 'package:get/get.dart';

class Dimentions {
//standard relations where screenheight of 844 wastaken as default

  static double size10 = 844 / 10;
  static double size15 = 844 / 15;
  static double size16 = 844 / 16;
  static double size18 = 844 / 18;
  static double size20 = 844 / 20;
  static double size24 = 844 / 24;
  static double size26 = 844 / 26;
  static double size30 = 844 / 30;
  static double size45 = 844 / 45;
  static double size350 = 844 / 350;

//getting screen heght and windth from device
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

//dynamic height padding and margin
  static double height10 = screenHeight / size10;
  static double height15 = height10 * 1.5;
  static double height20 = height10 * 2;
  static double height30 = height10 * 3;
  static double height45 = height10 * 4.5;
  static double height100 = height10 * 10;
  static double height120 = height10 * 12;

//dynamic width padding and margin
  static double width10 = screenWidth / size10;
  static double width15 = width10 * 1.5;
  static double width20 = width10 * 2;
  static double width30 = width10 * 3;
  static double width45 = width10 * 4.5;
  static double width120 = width10 * 12;

//font sizes

  static double font26 = screenHeight / size26;
  static double font24 = screenHeight / size24;
  static double font20 = screenHeight / size20;
  static double font18 = screenHeight / size18;
  static double font16 = screenHeight / size15;
  static double font12 = screenHeight / (42.2 * 20 / 12);

//Radius
  static double radius10 = screenHeight / size10;
  static double radius15 = radius10 * 1.5;
  static double radius20 = radius10 * 2;
  static double raduis30 = radius10 * 3;

//icon Size
  static double iconSize24 = screenHeight / size24;
  static double iconSize16 = screenHeight / size16;

//popular food page image
  static double coverSizePopular = screenHeight / size350;
}
