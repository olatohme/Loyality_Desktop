import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration underLine;
  int? maxline;

  TextUtils({
    required this.fontSize,
    required this.fontWeight,
    required this.text,
    required this.color,
    required this.underLine,
    this.maxline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline,
      style: TextStyle(
        decoration: underLine,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        
      ),
    );
  }
}
