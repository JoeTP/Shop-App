import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  Color color;
  double fontSize;
  TextOverflow overflow;
  FontWeight fontWeight;
  String text;

  TitleText({
    Key? key,
    this.color = Colors.black,
    this.fontSize = 18,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w500,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        overflow: overflow,
        fontWeight: fontWeight,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  Color color;
  double fontSize;
  int? maxLines;
  TextOverflow overflow;
  String text;
  FontWeight? fontWeight;
  TextDecoration? decoration;


  MediumText({
    Key? key,
    this.color = Colors.grey,
    this.fontSize = 10,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.decoration,

    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          overflow: overflow,
          fontWeight: fontWeight,
          decoration: decoration
        ),
    );
  }
}

class SmallText extends StatelessWidget {
  Color color;
  double fontSize;
  TextOverflow? overflow;
  String text;
  int? maxLines;

  SmallText({
    Key? key,
    this.color = Colors.grey,
    this.fontSize = 8,
    this.overflow,
    this.maxLines,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          overflow:  overflow  ,
          textBaseline: TextBaseline.ideographic
        ),
    );
  }
}
