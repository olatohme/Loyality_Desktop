import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/contoller.dart';
import 'package:desktopapp/show_api.dart/api_dashboard.dart';
import 'package:desktopapp/storage.dart';
import 'package:desktopapp/widgets/button.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class wel extends StatelessWidget {
  wel({Key? key}) : super(key: key);
  var controller = Get.find<Dash_controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              Image.asset(
                'assets/word1.png',
                width: 500,
                height: 300,
              ),
              TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  text: "Welcome, admin, to your loyalty points application ",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 20,
              ),
              TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  text:
                      "   Log in, then add packages and process partner subscription requests",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 70,
              ),
              Button(
                onPressed: () async {
        //            final storage1 = FlutterSecureStorage();
        // storage1.delete(key: 'token');
                  Securestorage storage = Securestorage();
                  ApiRequests.Token = await storage.read('token');
                  if (ApiRequests.Token != null) {
                    EasyLoading.show(status: "Please waiting...");
                    Api.bundles = await Api.GetBundles(ApiRequests.Token!);
                    controller.requests =
                        await controller.GetRequests(ApiRequests.Token!);
                    print(controller.requests.length);

                    controller
                        .isLoading_request(!controller.isLoading_request.value);
                    controller.values =
                        await controller.GetValues(ApiRequests.Token!);
                    controller.segment =
                        await controller.GetSegmentation(ApiRequests.Token!);
                    controller.command =
                        await controller.Getcommand(ApiRequests.Token!);
                    controller.users =
                        await controller.GetUsers(ApiRequests.Token!);
                    controller.partners =
                        await controller.GetPartners(ApiRequests.Token!);
                    controller.convert =
                        await controller.Getconvert(ApiRequests.Token!);
                    controller.isLoading_dash(!controller.isLoading_dash.value);
                    EasyLoading.showSuccess("Welcome..");
                    Get.toNamed('/dashbord');
                  } else
                    Get.offNamed('/login');
                },
                text: "Get Started",
                hight: 70,
                width: 250,
              ),
            ],
          ),
          SizedBox(
            width: 70,
          ),
          Image.asset(
            'assets/discount.png',
            width: 500,
            height: 500,
          ),
        ],
      ),
    );
  }
}
