import 'package:delivery_app/utils/dimentions.dart';
import 'package:delivery_app/widgets/BodyText.dart';
import 'package:delivery_app/widgets/HeaderText.dart';
import 'package:delivery_app/widgets/app_column.dart';
import 'package:delivery_app/widgets/icon_and_text.dart';
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
        //slider section
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
        //dots indicator
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
        ),
        //popular text divider
        SizedBox(height: Dimentions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimentions.width45),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HeaderText(text: 'Popular'),
              SizedBox(
                width: Dimentions.width20,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: HeaderText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimentions.width20,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: BodyText(
                  text: 'Food Pairing',
                ),
              )
            ],
          ),
        ),
        //list of food and images
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimentions.width45,
                    right: Dimentions.width45,
                    bottom: Dimentions.height10),
                child: Row(
                  children: [
                    //image
                    Container(
                      width: Dimentions.height120,
                      height: Dimentions.height120,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimentions.radius20),
                        color: Colors.redAccent,
                        image: const DecorationImage(
                            image: AssetImage('assets/image/food.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    //text section
                    Expanded(
                      child: Container(
                        height: Dimentions.height100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimentions.radius20),
                                bottomRight:
                                    Radius.circular(Dimentions.radius20)),
                            color: Colors.white60),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimentions.width20,
                              right: Dimentions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Dimentions.height10,
                              ),
                              HeaderText(
                                text:
                                    '10 top meals that you should defineately order',
                                size: Dimentions.font18,
                              ),
                              SizedBox(
                                height: Dimentions.height10,
                              ),
                              BodyText(text: 'Our Editor\'s pick'),
                              SizedBox(
                                height: Dimentions.height10,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const IconAndText(
                                      icon: Icons.circle_sharp,
                                      text: 'Normal',
                                      iconColor: AppColors.iconColor1,
                                    ),
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
                  ],
                ),
              );
            })
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
                bottom: Dimentions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
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
              child: AppColumn(
                text: 'Mushroom Stew',
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
