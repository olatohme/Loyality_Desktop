//prefer
// ignore_for_file: file_names

import 'dart:convert';
import 'dart:math';

import 'package:desktopapp/view/Dashbord.dart';
import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/contoller.dart';

import 'package:desktopapp/show_api.dart/api_dashboard.dart';
import 'package:desktopapp/widgets/button.dart';
import 'package:desktopapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Add1.dart';
import 'Add1.dart';

class Add1 extends StatelessWidget {
  Add1({Key? key}) : super(key: key);
  var name = "";
  var price = "";
  var exprition = "";
  var bonus = "";
  var gems = "";
  var golden_offers_number = "";
  var silver_offers_number = "";
  var bronze_offers_number = "";
  var new_offers_number = "";
  var status_addbundle;
  var token;
  var controller = Get.find<Dash_controller>();
  //var Tokenadmin;
  // TextEditingController new_offers_number = TextEditingController(text: "");

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          height: MediaQuery.of(context).size.height,
          width: 500,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 160,
                    child: Divider(
                      color: kPrimaryColor,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Add Bundle',
                    style: TextStyle(
                        fontFamily: 'Acaslon Regular',
                        fontSize: 20,
                        color: black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 140,
                    child: Divider(
                      color: kPrimaryColor,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: CustomTextField(
                  hintText: 'name ',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    name = value;
                  },
                ),
              ),
               SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 50, right: 50),
              //   child: CustomTextField(
              //     hintText: 'price ',
              //     prefixIcon: Text(""),
              //     obscureText: false,
              //     suffixIcon: const Icon(Icons.person, color: Colors.grey),
              //     validator: (value) {
              //       if (value.isEmpty) {
              //         return 'Please enter a name';
              //       }
              //     },
              //     hight: 60,
              //     width: MediaQuery.of(context).size.width * 0.80,
              //     keyboardType: TextInputType.emailAddress,
              //     onchange: (value) {
              //       price = value;
              //     },
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: CustomTextField(
                  hintText: ' exprition',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    exprition = value;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: CustomTextField(
                  hintText: 'bonus ',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    bonus = value;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: CustomTextField(
                  hintText: 'gems ',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    gems = value;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: CustomTextField(
                  hintText: 'Golden offers users ',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    golden_offers_number = value;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: CustomTextField(
                  hintText: 'Silver offers users',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    silver_offers_number = value;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: CustomTextField(
                  hintText: ' Bronze offers users',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    bronze_offers_number = value;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: CustomTextField(
                  hintText: ' New offers users',
                  prefixIcon: Text(""),
                  obscureText: false,
                  suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                  },
                  hight: 60,
                  width: MediaQuery.of(context).size.width * 0.80,
                  keyboardType: TextInputType.emailAddress,
                  onchange: (value) {
                    new_offers_number = value;
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: SizedBox(
                      height: 60,
                      width: 180,
                      child: Button(
                        onPressed: () async {
                          EasyLoading.show(status: "Loading...");
                          await addBundle(context);
                          if (status_addbundle == 200 ||
                              status_addbundle == 201) {
                            controller.isLoading_dash(
                                !controller.isLoading_dash.value);
                            Get.back();
                          }
                        },
                        text: "Add",
                        hight: 50,
                        width: 200,
                      ),
                    ),
                  ),
                ],
              ),
            ],
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

 

  Future<void> addBundle(BuildContext context) async {
    try {
      print("token is  ${ApiRequests.Token}");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiRequests.Token}'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse('${ApiRequests.add_bundle}'));
      request.fields.addAll({
        "name": name,
        " expiration_period": exprition,
        // "price":price,
        "bonus": bonus,
        "gems": gems,
        "golden_offers_number": golden_offers_number,
        "silver_offers_number": silver_offers_number,
        "bronze_offers_number": bronze_offers_number,
        "new_offers_number": new_offers_number,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      status_addbundle = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        Api.bundles = await Api.GetBundles(ApiRequests.Token!);
        controller.isLoading_dash(!controller.isLoading_dash.value);

        print(response.statusCode);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk");
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
        print("not okkk");
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
