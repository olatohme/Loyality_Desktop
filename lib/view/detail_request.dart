import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/contoller.dart';
import 'package:desktopapp/widgets/button.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../model.dart/request_model.dart';

class detailsrequest extends StatelessWidget {
  RequestsModel request;
  detailsrequest(this.request);
  var controller = Get.find<Dash_controller>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        //backgroundColor: Color.fromARGB(255, 225, 209, 228),
        content: SingleChildScrollView(
            child: Container(
      // width: double.infinity,
      // height: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.5,
      color: kPrimaryColor,
      child: Stack(children: [
        Positioned(
          left: 30,
          top: 20,
          child: IconButton(
              onPressed: () {
                //  print("Email is ${controller1.profile!.user.email}");

                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: white,
                size: 30,
              )),
        ),
        Positioned(
          right: 70,
          top: 20,
          child: Text(
            "تفاصيل الطلب",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        Positioned.fill(
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.grey.shade100,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.account_circle, color: Colors.grey),
                            SizedBox(
                              width: 30,
                            ),
                            TextUtils(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                text:
                                    "Name is : ${request.user.fname}  ${request.user.lname}",
                                color: Colors.black,
                                underLine: TextDecoration.none),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.grey.shade100,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.email, color: Colors.grey),
                            SizedBox(
                              width: 30,
                            ),
                            TextUtils(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                text: "Email is : ${request.user.email} ",
                                color: Colors.black,
                                underLine: TextDecoration.none),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.grey.shade100,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.phone, color: Colors.grey),
                            SizedBox(
                              width: 30,
                            ),
                            TextUtils(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                text: "Phone is : ${request.user.phoneNumber}",
                                color: Colors.black,
                                underLine: TextDecoration.none),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.grey.shade100,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.list, color: Colors.grey),
                            SizedBox(
                              width: 30,
                            ),
                            {request.details}.length >= 15
                                ? TextUtils(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                    text: " ${request.details}  ",
                                    maxline: 2,
                                    color: Colors.black,
                                    underLine: TextDecoration.none)
                                : TextUtils(
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                    text: " ${request.details}  ",
                                    maxline: 1,
                                    color: Colors.black,
                                    underLine: TextDecoration.none)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          Button(
                            onPressed: () async {
                              openDialog_accept(context);
                            },
                            text: "قبول  ",
                            hight: 40,
                            width: 100,
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Button(
                            onPressed: () async {
                              openDialog_reject(context);
                            },
                            text: "رفض ",
                            hight: 40,
                            width: 100,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ]))))),
        Positioned(
          right: 130,
          top: 90,
          child: Stack(children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
              ),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: white,
                  image: DecorationImage(
                    image: NetworkImage(
                        "${controller.baseurl_img}${request.user.imgUrl}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ]),
        )
      ]),
    )));
  }

  void openDialog_reject(BuildContext context) {
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
            text: " هل انت متأكد من  رفض الطلب  ؟؟ ",
            color: Colors.black,
            underLine: TextDecoration.none),
        actions: [
          Row(
            children: [
              Button(
                onPressed: () async {
                  controller.isDialogOpen.value = false;
                   EasyLoading.show(status: 'Loading..');
                  await controller.Reject(ApiRequests.Token!, request.id);
                  if (controller.status_reject == 200 ||
                      controller.status_reject == 201) {
                    controller
                        .isLoading_request(!controller.isLoading_request.value);
                    Get.back();
                    Get.back();
                    
                  }
                  ;
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

  void openDialog_accept(BuildContext context) {
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
            text: " هل انت متأكد من قبول الطلب  ؟؟ ",
            color: Colors.black,
            underLine: TextDecoration.none),
        actions: [
          Row(
            children: [
              Button(
                onPressed: () async {
                    EasyLoading.show(status: "Loading...");
                  controller.isDialogOpen.value = false;
                  await controller.Accept(ApiRequests.Token!, request.id);
                  if (controller.status_accept == 200 ||
                      controller.status_accept == 201) {
                    controller
                        .isLoading_request(!controller.isLoading_request.value);
                    Get.back();
                    Get.back();
                  }
                  ;
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
