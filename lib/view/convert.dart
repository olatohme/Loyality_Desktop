import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contoller.dart';

class convert extends StatelessWidget {
   convert({ Key? key }) : super(key: key);
  var controller = Get.find<Dash_controller>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SingleChildScrollView(
            child: Container(
                color: Colors.white70,
                height: 1000,
                width: 500,
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                       child:Card(
                        elevation: 30,
                        shadowColor: kPrimaryColor.withOpacity(0.2),
                        child:  Column(
                          children: [
                            SizedBox(height: 5,),
                       TextUtils(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        text:
                                             "تم تحويل   ${controller.convert[index].bonus} نقطة",
                                        // text: "name is: Adidas",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                    TextUtils(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        text:
                                             " الى ${controller.convert[index].gems} جوهرة",
                                        // text: "name is: Adidas",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                        TextUtils(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        text:
                                            "  ${controller.convert[index].customer.user.fname} ${controller.convert[index].customer.user.lname} من قبل ",
                                        // text: "name is: Adidas",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                    SizedBox(
                                      height: 5,
                                    ),
                                        
                                    TextUtils(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        text:
                                            "${controller.convert[index].createdAt}",
                                        // text: "name is: Adidas",
                                        color: Colors.black,
                                        underLine: TextDecoration.none),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemCount:controller.convert.length ,
                    ),
                  ),
                ]))));
  }
}