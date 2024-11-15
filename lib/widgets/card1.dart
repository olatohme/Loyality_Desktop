import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';

class card1 extends StatelessWidget {
  String name;
  int num;
  card1(this.name,this.num);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
      ),
      Positioned(
          top: 5,
          left: 20,
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(360),
                ),
              ))),
      Positioned(
        top: 10,
        left: 100,
        child: TextUtils(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            text: '${name} ',
            color: black,
            underLine: TextDecoration.none),
      ),
      Positioned(
        top: 50,
        left: 100,
        child: TextUtils(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            text: '${num} ',
            color: black,
            underLine: TextDecoration.none),
      )
    ]);
  }
}
