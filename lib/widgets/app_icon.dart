import 'package:delivery_app/utils/dimentions.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  const AppIcon(
      {Key? key,
      required this.icon,
      this.size = 40,
      this.backgroundColor = const Color(0xDDfcf4e4),
      this.iconColor = const Color(0xFF756d54)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimentions.iconSize16,
      ),
    );
  }
}
