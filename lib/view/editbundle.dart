import 'dart:convert';
import 'dart:math';

import 'package:desktopapp/view/Dashbord.dart';
import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/contoller.dart';

import 'package:desktopapp/show_api.dart/api_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




import '../model.dart/bundle_model.dart';

class EditBundle extends StatelessWidget {
  BundlesModel bundle;
  EditBundle(this.bundle);
  var controller = Get.find<Dash_controller>();
  var name = TextEditingController();
  var price = TextEditingController();
  var bonus = TextEditingController();
  var gems = TextEditingController();
  var golden_offers_number = TextEditingController();
  var silver_offers_number = TextEditingController();
  var bronze_offers_number = TextEditingController();
  var new_offers_number = TextEditingController();
  var status_addbundle;
  var status_upbundle;
  var token;
  @override
  Widget build(BuildContext context) {
//class EditBundle extends StatelessWidget {

    //var Tokenadmin;
    // TextEditingController new_offers_number = TextEditingController(text: "");

    // This widget is the root of your application.
    // @override
    // Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          height: 1000,
          width: 500,
          //child: Row(
          // children: [
          /*  Expanded(
              child: Container(
                color: Colors.white70,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/vv.jpg'),
                          fit: BoxFit.cover,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ), */
          // Expanded(
          // flex: 1,
          // child: Container(
          //color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Column(
              children: [
                const Text('Add Bundle',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: name,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.purple,
                      hintText: 'name',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: price,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.purple,
                      hintText: 'price',
                      hintStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: gems,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.purple,
                      hintText: 'bonus',
                      hintStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: bonus,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.purple,
                      hintText: 'gems',
                      hintStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: golden_offers_number,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.purple,
                      hintText: 'golden_offers_number',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: silver_offers_number,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.purple,
                      hintText: 'silver_offers_number',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: bronze_offers_number,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.purple,
                      hintText: ' bronze_offers_number',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: new_offers_number,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.purple,
                      hintText: 'new_offers_number',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: SizedBox(
                        height: 60,
                        width: 180,
                        child: MaterialButton(
                          color: Colors.purple,
                          onPressed: () async {
                              EasyLoading.show(status: "Loading...");
                            await editBundle(context,ApiRequests.Token!);
                            if (status_upbundle == 200 ||
                                status_upbundle == 201) {
                              controller.isLoading_dash(
                                  !controller.isLoading_dash.value);
                               Get.back();
                             
                              Get.back();
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*   Future<void> addMethod(BuildContext context) async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    http.Response res = await ApiRequests.addBundle(
      name.text.toString(),
      // price.text,
      int.parse(price.text.toString()),
      int.parse(bonus.text.toString()),
      int.parse(gems.text.toString()),
      int.parse(golden_offers_number.text.toString()),
      int.parse(silver_offers_number.text.toString()),
      int.parse(bronze_offers_number.text.toString()),
      int.parse(new_offers_number.text.toString()),
    );

    if (res.body.contains("id")) {
      Map<String, dynamic> info = json.decode(res.body);
      String token = info['token'];
      authProvider.setAuthToken(token);
      Pref pref = Pref();
      await pref.Addbundle(info);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Delete();
      }));
    } 
    else {
      print(" adding bundle failed");
      print(res.body);
    } */

  // Future<String> getToken() async {
  
   
  //   Map<String, dynamic> dt = jsonDecode(data!);
  //   String token = dt["token"];
  //   return token;
  // }

  Future<void> editBundle(BuildContext context,String token) async {
    try {
      print("token is  ${ApiRequests.Token}");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiRequests.Token}'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${ApiRequests.up_bundle}${bundle.id}'));
      request.fields.addAll({
        "name": name.text,
        "price": price.text,
        "bonus": bonus.text,
        "gems": gems.text,
        "golden_offers_number": golden_offers_number.text,
        "silver_offers_number": silver_offers_number.text,
        "bronze_offers_number": bronze_offers_number.text,
        "new_offers_number": new_offers_number.text,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      status_upbundle = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
         Api.bundles = await Api.GetBundles(ApiRequests.Token!);
         controller.isLoading_dash(
                                  !controller.isLoading_dash.value);
         EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk  edit");

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
        print("not okkk edit");
        print(response.request);
        // update();
      }
    } catch (e) {
       EasyLoading.showError(e.toString());
      print("errrorrr");
      print(e);
    }
  }
//   Future<void> addBundle(BuildContext context) async {
//     // try {
//     String token = await getToken();
//     http.Response res = await ApiRequests.addBundle(
//         name.text.toString(),
//         // price.text,
//         int.parse(price.text),
//         int.parse(bonus.text),
//         int.parse(gems.text),
//         int.parse(golden_offers_number.text),
//         int.parse(silver_offers_number.text),
//         int.parse(bronze_offers_number.text),
//         int.parse(new_offers_number.text),
//         token);

//     if (res.statusCode == 200) {
//       var respon = jsonDecode(res.body);
//       String message = respon["message"];
//       // Fluttertoast.showToast(
//       //     msg: message,
//       //     backgroundColor: Colors.lightBlue,
//       //     textColor: Colors.white,
//       //     gravity: ToastGravity.CENTER,
//       //     timeInSecForIosWeb: 5);
//       print(message);

//       //  Fluttertoast.showToast(
//       //   msg: "adding bundle succeded",
//       //msg: res.body,
//       //   backgroundColor: Colors.lightBlue,
//       //   textColor: Colors.white,
//       //   gravity: ToastGravity.CENTER,
//       //   timeInSecForIosWeb: 5);

//     } else {
//       // Fluttertoast.showToast(
//       //     msg: "some error occured",
//       //     backgroundColor: Colors.lightBlue,
//       //     textColor: Colors.white,
//       //     gravity: ToastGravity.CENTER,
//       //     timeInSecForIosWeb: 5);
//       print("some error occured");
//       //Fluttertoast.showToast(
//       //  msg: "adding bundle failed",
//       //  toastLength: Toast.LENGTH_SHORT,
//       //  backgroundColor: Colors.lightBlue,
//       //  textColor: Colors.white,
//       //  gravity: ToastGravity.CENTER,
//       //  timeInSecForIosWeb: 5);
//     }
//   }
//   //catch (e) {
//   // print('errorr');
//   // print(e);
//   //}
// }
}
