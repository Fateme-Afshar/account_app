

import 'package:flutter/cupertino.dart';

class CustomTitle extends StatelessWidget{
  final String title;
  const CustomTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(),
    );
  }

}

Text buildSingleLineText(String text, TextStyle style) {
  return Text(
    text,
    style: style,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
  );
}

TextStyle buildTextStyle(
    {double? fontSize,
      Color? color,
      FontStyle? fontStyle,
      FontWeight? fontWeight}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight);
}

Text buildTitle(String title) => Text(
  title,
  style: buildTextStyle(fontSize: 24, fontWeight: FontWeight.bold),
);