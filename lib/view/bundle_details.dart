import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/contoller.dart';
import 'package:desktopapp/view/editbundle.dart';
import 'package:desktopapp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../api_requests.dart';
import '../model.dart/bundle_model.dart';
import '../show_api.dart/api_dashboard.dart';
import '../widgets/text.dart';

class detailsbundle extends StatelessWidget {
  BundlesModel bundle;
  detailsbundle(this.bundle);
  var controller = Get.find<Dash_controller>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SingleChildScrollView(
            child: Container(
      color: Colors.white70,
      height: 1000,
      width: 500,
      child: Column(
        children: [
            SizedBox(
                      height: 10,
                    ),
                     Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                          onPressed: () {
                          
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back_sharp),
                          color: black,
                          iconSize: 40,
                        ),
                         SizedBox(
                          width: 200,
                        ),
                    TextUtils(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        text: 'تفاصيل الباقة  ',
                        color: Colors.black,
                        underLine: TextDecoration.none),]),
                   
                    
                      Row(
                        children: [
                          Image.asset(
                            'assets/bb.png',
                            width: 200,
                            height: 500,
                          ),
                          SizedBox(width: 20,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: 'Name : ${bundle.name} ',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 5,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: 'Price : ${bundle.price} ',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 5,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: 'bounus : ${bundle.bonus} ',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 5,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: 'gems : ${bundle.gems} ',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 5,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: 'expiration_period : ${bundle.expirationPeriod} ',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 5,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: 'golden_offers_number: ${bundle.goldenOffersNumber} ',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 5,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: 'silver_offers_number : ${bundle.silverOffersNumber} ',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 5,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: 'bronze_offers_number: ${bundle.bronzeOffersNumber} ',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 5,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: 'new_offers_number: ${bundle.newOffersNumber} ',
              color: black,
              underLine: TextDecoration.none),
                          ],)
                        ],
                      ),
                     
                  
         
          
          Row(
            children: [
              SizedBox(width: 120,),
              Button(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => EditBundle(bundle));
                },
                text: " تعديل ",
                hight: 40,
                width: 80,
              ),
              SizedBox(
                width: 80,
              ),
              Button(
                onPressed: () async {
                openDialog(context);
                  
                },
                text: "  حذف  ",
                hight: 40,
                width: 90,
              ),
            ],
          )
        ],
      ),
    )));
  }
   void openDialog(BuildContext context) {
    controller.isDialogOpen.value = true;
    Get.dialog(
      AlertDialog(
        titlePadding: EdgeInsets.only(top: 30, left: 190),
        title: TextUtils(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            text: "",
            color: Colors.black,
            underLine: TextDecoration.none),
        content: TextUtils(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            text: " هل انت متأكد من  حذف الباقة  ؟؟ ",
            color: Colors.black,
            underLine: TextDecoration.none),
        actions: [
          Row(
            children: [
              Button(
                onPressed: () async {
                  
                  controller.isDialogOpen.value = false;
                   EasyLoading.show(status: 'Loading..');
                    await Api.DeleteBundle(ApiRequests.Token!, bundle.id);
                  // await Api.GetBundles(ApiRequests.Token);
                  if (Api.status_delbund == 200 || Api.status_delbund == 201) {
                    controller.isLoading_dash(!controller.isLoading_dash.value);
                    Get.back();
                  }
                },
                text: "نعم",
                hight: 40,
                width: 100,
              ),
              SizedBox(width: 30),
              Button(
                onPressed: () {
                  controller.isDialogOpen.value = false;
                  Get.back();
                },
                text: "لا",
                hight: 40,
                width: 100,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
