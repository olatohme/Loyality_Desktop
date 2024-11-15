import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/contoller.dart';
import 'package:desktopapp/widgets/cardpartner.dart';
import 'package:desktopapp/widgets/carduser.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class partners extends StatelessWidget {
   partners({Key? key}) : super(key: key);
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
                        text: 'عرض الشركاء  ',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                          SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () async {
                          controller
                        .isLoading_request(!controller.isLoading_request.value);
                        controller.partners =
                        
                           await controller.GetPartners(ApiRequests.Token!);
                             controller
                        .isLoading_request(!controller.isLoading_request.value);
                      },
                      icon: Icon(Icons.refresh),
                      iconSize: 40,
                      color: Colors.black,
                    ),]),
                    SizedBox(
                      height: 10,
                    ),
                      Obx(() {
                    if (controller.isLoading_request.isTrue) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return cardpartner(controller.partners[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemCount: controller.partners.length,
                    ),
                  );})
                ]))));
  }
}
