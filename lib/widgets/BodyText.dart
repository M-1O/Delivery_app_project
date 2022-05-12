import 'package:flutter/cupertino.dart';
import 'package:delivery_app/utils/dimentions.dart';

class BodyText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  BodyText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 0,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontFamily: 'Open Sans',
        fontSize: size == 0 ? Dimentions.font12 : size,
        height: height,
      ),
    );
  }
}
