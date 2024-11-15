import 'dart:convert';

import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/contoller.dart';
import 'package:desktopapp/widgets/button.dart';
import 'package:desktopapp/widgets/custom_textfield.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class value_bonus extends StatelessWidget {
  int id;
  value_bonus(this.id);
  var controller = Get.find<Dash_controller>();

  var name = "";
  var Value = "";
  var profit = "";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SingleChildScrollView(
            child: Container(
      color: Colors.white70,
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.38,
      child: Column(
        children: [
          Row(children: [
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
              width: 80,
            ),
            TextUtils(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                text: ":  ادخل قيمة الجوهرة الواحدة  ",
                color: Colors.black,
                underLine: TextDecoration.none),
          ]),
          SizedBox(
            height: 20,
          ),
         
          Padding(
            padding: EdgeInsets.only(left: 80, right: 80),
            child: CustomTextField(
              hintText: 'value  ',
              obscureText: false,
              prefixIcon: Text(""),
              suffixIcon: const Icon(Icons.email, color: Colors.grey),
              validator: (value) {},
              hight: 70,
              width: MediaQuery.of(context).size.width * 0.80,
              keyboardType: TextInputType.emailAddress,
              onchange: (value) {
                Value = value;
                //  controller.validateEmail();
              },
            ),
          ),
           SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 80, right: 80),
            child: CustomTextField(
              hintText: 'profit  ',
              obscureText: false,
              prefixIcon: Text(""),
              suffixIcon: const Icon(Icons.email, color: Colors.grey),
              validator: (value) {},
              hight: 70,
              width: MediaQuery.of(context).size.width * 0.80,
              keyboardType: TextInputType.emailAddress,
              onchange: (value) {
                profit = value;
                //  controller.validateEmail();
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Button(
            onPressed: () async {
                EasyLoading.show(status: "Loading...");
              await add_value(context, id);
              if (controller.status_updefult == 200 ||
                  controller.status_updefult == 201) {

                controller.isLoading_dash(!controller.isLoading_dash.value);
                Get.back();
              }
            },
            text: " تعيين ",
            hight: 50,
            width: 200,
          ),
        ],
      ),
    )));
  }

  Future<void> add_value(BuildContext context, int id) async {
    try {
      //print("token is  ${ApiRequests.Token}");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiRequests.Token}'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${controller.baseurl}default/${id}'));
      request.fields.addAll({
        
        "value": Value,
        "profit": profit,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      controller.status_updefult = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk  defult");
        controller.values = await controller.GetValues(ApiRequests.Token!);
        controller.isLoading_dash(!controller.isLoading_dash.value);
 EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        // toast(context, jsonDecode(responseBody)['message']);

        // productList = await showprod();
        // print(isloading);
        // isloading(!isloading.value);
        // print(isloading);
      } else {
         EasyLoading.showError(jsonDecode(responseBody)['message']);
        //  toast(context, jsonDecode(responseBody)['message']);
        // print(token);
        print(res['message']);
        print(response.statusCode);
        print("not okkk defult");
        print(response.request);
        // update();
      }
    } catch (e) {
       EasyLoading.showError(e.toString());
      print("errrorrr");
      print(e);
    }
  }
}
