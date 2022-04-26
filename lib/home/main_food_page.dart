import 'package:delivery_app/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/home/food_page_body.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/widgets/BodyText.dart';
import 'package:delivery_app/widgets/HeaderText.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Dimentions.height45, bottom: Dimentions.height15),
            padding: EdgeInsets.only(
                left: Dimentions.width20, right: Dimentions.width20),
            //add scrolling parameter
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    HeaderText(text: 'Kazakhstan', color: AppColors.mainColor),
                    Row(
                      children: [
                        BodyText(
                          text: 'Astana',
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimentions.height45,
                    height: Dimentions.height45,
                    child: const Icon(Icons.search, color: Colors.white),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.raduis30),
                      color: AppColors.mainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          FoodPageBody(),
        ],
      ),
    );
  }
}
