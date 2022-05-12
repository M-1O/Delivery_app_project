import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimentions.dart';
import 'BodyText.dart';
import 'HeaderText.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(
          text: text,
          size: Dimentions.font26,
        ),
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
            SizedBox(width: Dimentions.width10),
            BodyText(text: '4.5'),
            SizedBox(width: Dimentions.width10),
            BodyText(text: '1302'),
            SizedBox(width: Dimentions.width10),
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
    );
  }
}
