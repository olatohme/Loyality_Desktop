import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';

class card2 extends StatelessWidget {
  String name;
   String name2;
  int num;
  card2(this.name,this.name2,this.num);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 130,
        width: 300,
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
              height: 80,
              width: 80,
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
        left: 70,
        child: TextUtils(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            text: '${name} ',
            color: black,
            underLine: TextDecoration.none),
      ),
       Positioned(
        top: 30,
        left: 100,
        child: TextUtils(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            text: '${name2} ',
            color: black,
            underLine: TextDecoration.none),
      ),
      Positioned(
        top: 70,
        left: 150,
        child: TextUtils(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            text: '${num}',
            color: black,
            underLine: TextDecoration.none),
      )
    ]);
  }
}
