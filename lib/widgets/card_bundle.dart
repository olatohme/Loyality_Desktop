import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/view/bundle_details.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/view/editbundle.dart';
import 'package:desktopapp/model.dart/bundle_model.dart';
import 'package:desktopapp/show_api.dart/api_dashboard.dart';
import 'package:desktopapp/widgets/button.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cardBundle extends StatelessWidget {
  BundlesModel bundle;
 cardBundle(this.bundle);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => showDialog(context: context, builder: (context) => detailsbundle(bundle)),
      child: Container(
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
          child: Column(
            children: [
              TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: 'Name : ${bundle.name} ',
                  color: black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
              TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: 'Price : ${bundle.price} ',
                  color: black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
             
              TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: 'expiration_period : ${bundle.expirationPeriod} ',
                  color: black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
            
              
            
            
               
            ],
          )),
    );
  }
}
