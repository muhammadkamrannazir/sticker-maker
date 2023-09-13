import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final FontStyle? fontStyle;

  CustomText(
    this.text, {
    Key? key,
    this.maxLines,
    this.color = Colors.black,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);
  CustomText.size14(
    this.text, {
    Key? key,
    this.maxLines,
    this.color = Colors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);
  CustomText.size18(
    this.text, {
    Key? key,
    this.maxLines,
    this.color = Colors.black,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      // textDirection: TextDirection.ltr,
      style: TextStyle(
        height: 1,
        color: color,
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight,
        fontFamily: 'Noto Nastaliq Urdu',
        overflow: overflow,
        fontStyle: fontStyle,
        wordSpacing: 0,
        letterSpacing: 0,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
