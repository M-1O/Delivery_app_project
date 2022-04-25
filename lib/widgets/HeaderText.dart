import 'package:delivery_app/utils/dimentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  HeaderText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: GoogleFonts.roboto(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: size == 0 ? Dimentions.font20 : size,
      ),
    );
  }
}
