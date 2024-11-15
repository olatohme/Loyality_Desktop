import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/model.dart/defaultvalue_model.dart';
import 'package:desktopapp/view/bundle_details.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/view/editbundle.dart';
import 'package:desktopapp/model.dart/bundle_model.dart';
import 'package:desktopapp/show_api.dart/api_dashboard.dart';
import 'package:desktopapp/view/value_bonus.dart';
import 'package:desktopapp/widgets/button.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cardValue extends StatelessWidget {
  DefaultModel value;
  cardValue(this.value);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      // showDialog(context: context, builder: (context) => detailsbundle(bundle)),
      child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
          height: 80,
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
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              value.name.toString() == "B2G"
                  ? TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: 'Each gem equals ${value.value} bonus ',
                      color: black,
                      underLine: TextDecoration.none)
                  : value.name.toString() == "G2\$"? TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: 'Each 1\$ equals ${value.value} Gems  ',
                      color: black,
                      underLine: TextDecoration.none):
                       TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: 'Profit ${value.value}  ',
                      color: black,
                      underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
               GestureDetector(
            onTap: () {
               showDialog(
                      context: context, builder: (context) => value_bonus(value.id));
            },
            child: const Center(
              child: Text(
                'Edit',
                style: TextStyle(
                    fontFamily: 'Acaslon Regular',
                    fontSize: 15,
                    color: kPrimaryColor,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
              // Button(
              //   onPressed: () {
              //     showDialog(
              //         context: context, builder: (context) => value_bonus(value.id));
              //   },
              //   text: "تعديل ",
              //   hight: 40,
              //   width: 70,
              // ),
            ],
          )),
    );
  }
}
