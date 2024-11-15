
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';




class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
 final double width;
  final double hight;
  const Button({
    required this.hight,
    required this.width,
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary:kPrimaryColor,
        minimumSize: Size(width, hight),
        shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
      ),
      child: TextUtils(
        color: Colors.white,
        text: text,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        underLine: TextDecoration.none,
      ),
    );
  }
}
