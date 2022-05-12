import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimentions.dart';
import 'package:delivery_app/widgets/HeaderText.dart';
import 'package:delivery_app/widgets/app_column.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Positioned image cover in the popular food section
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimentions.coverSizePopular,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/food.jpeg'),
                        fit: BoxFit.cover)),
              )),
          //Icons and Buttons to Return and Shop
          Positioned(
              top: Dimentions.height45,
              left: Dimentions.width20,
              right: Dimentions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                      icon: Icons.arrow_back_ios,
                      backgroundColor: Colors.white.withOpacity(0.5)),
                  AppIcon(
                      icon: Icons.shopping_bag_outlined,
                      backgroundColor: Colors.white.withOpacity(0.5)),
                ],
              )),
          // Information card
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimentions.coverSizePopular - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimentions.width30,
                right: Dimentions.width30,
                top: Dimentions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimentions.radius20),
                  topLeft: Radius.circular(Dimentions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: 'Mushroom Stew'),
                  SizedBox(height: Dimentions.height20),
                  HeaderText(text: 'Introduce'),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimentions.height120,
        padding: EdgeInsets.only(
          top: Dimentions.height30,
          bottom: Dimentions.height30,
          left: Dimentions.width20,
          right: Dimentions.width20,
        ),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimentions.raduis30),
              topRight: Radius.circular(Dimentions.raduis30),
            )),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimentions.height20,
                bottom: Dimentions.height20,
                left: Dimentions.width20,
                right: Dimentions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimentions.width10 / 2,
                  ),
                  HeaderText(text: '0'),
                  SizedBox(
                    width: Dimentions.width10 / 2,
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
