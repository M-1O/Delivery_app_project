import 'package:delivery_app/utils/dimentions.dart';
import 'package:delivery_app/widgets/BodyText.dart';
import 'package:delivery_app/widgets/HeaderText.dart';
import 'package:delivery_app/widgets/icon_and_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimentions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print("Current value is " + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.blueAccent,
          height: Dimentions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    var transMatrix = cardScale(index, _currPageValue, _height, _scaleFactor);

    return Transform(
      transform: transMatrix,
      child: Stack(children: [
        Container(
            height: Dimentions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimentions.width10, right: Dimentions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.raduis30),
                color: index.isEven ? Color(0XFF69c5df) : Color(0XFF783a2f),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food.jpeg"),
                ))),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimentions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimentions.width30,
                right: Dimentions.width30,
                bottom: Dimentions.height10 * 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.readius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  )
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimentions.height15,
                  left: Dimentions.height15,
                  right: Dimentions.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText(text: 'Mushroom Stew'),
                  SizedBox(height: Dimentions.height10),
                  //Comment Section
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return const Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          );
                        }),
                      ),
                      const SizedBox(width: 10),
                      BodyText(text: '4.5'),
                      const SizedBox(width: 10),
                      BodyText(text: '1302'),
                      const SizedBox(width: 10),
                      BodyText(text: 'comments')
                    ],
                  ),
                  SizedBox(height: Dimentions.height20),
                  //time and distance
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const IconAndText(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconColor: AppColors.iconColor1),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        const IconAndText(
                            icon: Icons.location_on,
                            text: '1.7 km',
                            iconColor: AppColors.mainColor),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        const IconAndText(
                            icon: Icons.access_time_rounded,
                            text: '32 min',
                            iconColor: AppColors.iconColor2),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

//Shrink the side cards dynamically to get scaling effect
  dynamic cardScale(
      int index, double _currPageValue, double _height, double _scaleFactor) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      return matrix;
    } else {
      var currScale = 0.8;
      var yScale = _height * (1 - _scaleFactor) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, yScale, 0);
    }
    return matrix;
  }
}
