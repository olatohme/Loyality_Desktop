import 'package:desktopapp/storage.dart';
import 'package:desktopapp/view/Dashbord.dart';
import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/contoller.dart';

import 'package:desktopapp/show_api.dart/api_dashboard.dart';
import 'package:desktopapp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../widgets/custom_textfield.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);
  Api api = Api();
  var controller = Get.find<Dash_controller>();
  final RxBool _obscureText = true.obs;
  // This widget is the root of your application.
  @override
  var emailController = "";
  var passwordController = "";
  var status_login;
  var formkey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables

  //String? token = null;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Expanded(
          child: Container(
            color: Colors.white70,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/eee.png'),
                      fit: BoxFit.cover,
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  const Text('Welcome Back!',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      )),
                  // Row(
                  // children: [
                  // SizedBox(
                  // child: Icon(
                  // Icons.facebook,
                  //color: Colors.purple,
                  //size: 50,
                  //),
                  //),
                  //SizedBox(
                  //child: Icon(
                  //Icons.email,
                  //color: Colors.purple,
                  //size: 50,
                  //   ),
                  //     ),
                  // ],
                  //   ),
                  SizedBox(
                    height: 40,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 50, right: 50),
                  //   child: TextField(
                  //     style: TextStyle(
                  //       color: Colors.white70,
                  //     ),
                  //     decoration: InputDecoration(
                  //       fillColor: Colors.purple,
                  //       prefixIcon: Icon(
                  //         Icons.person,
                  //         color: Colors.white70,
                  //       ),
                  //       hintText: 'Name',
                  //       hintStyle: TextStyle(
                  //         color: Colors.white70,
                  //         fontSize: 15,
                  //       ),
                  //       filled: true,
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 80, right: 80),
                    child: CustomTextField(
                      hintText: 'الايميل',
                      obscureText: false,
                      prefixIcon: Text(""),
                      suffixIcon: const Icon(Icons.email, color: kPrimaryColor),
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                      hight: 70,
                      width: MediaQuery.of(context).size.width * 0.80,
                      onchange: (value) {
                        emailController = value;
                        //  controller.validateEmail();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: Obx(
                      () => CustomTextField(
                          hintText: 'كلمة المرور ',
                          prefixIcon: Text(""),
                          obscureText: _obscureText.value,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _obscureText.toggle();
                                print(_obscureText
                                    .value); // تبديل قيمة الـ RxBool بين true و false
                              },
                              child: Icon(
                                _obscureText.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _obscureText.value
                                    ? kPrimaryColor
                                    : Colors.grey,
                              )),

                          //const Icon(Icons.visibility, color: Colors.grey),

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a password ';
                            }
                            if (value.toString().length < 6) {
                              return 'Password should be longer or equal to 6 characters';
                            } else {
                              return null;
                            }
                          },
                          hight: 70,
                          width: MediaQuery.of(context).size.width * 0.80,
                          onchange: (value) {
                            passwordController = value;
                          }),
                    ),
                  ),

                  SizedBox(
                    height: 29,
                  ),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: Button(
                      onPressed: () async {
                        EasyLoading.show(status: "Loading...");
                        Securestorage storage = Securestorage();
                        ApiRequests.Token = await storage.read('token');
                        print("token save is :${ApiRequests.Token}");
                        await loginMethod(context);
                        if (status_login == 200 || status_login == 201) {
                          Api.bundles =
                              await Api.GetBundles(ApiRequests.Token!);
                          controller.requests =
                              await controller.GetRequests(ApiRequests.Token!);
                          print(controller.requests.length);

                          // controller.isLoading_request(
                          //     !controller.isLoading_request.value);
                          controller.values =
                              await controller.GetValues(ApiRequests.Token!);
                          controller.segment = await controller.GetSegmentation(
                              ApiRequests.Token!);
                          controller.command =
                              await controller.Getcommand(ApiRequests.Token!);
                          controller.users =
                              await controller.GetUsers(ApiRequests.Token!);
                          controller.partners =
                              await controller.GetPartners(ApiRequests.Token!);
                          controller.convert =
                              await controller.Getconvert(ApiRequests.Token!);
                          controller
                              .isLoading_dash(!controller.isLoading_dash.value);
                          EasyLoading.showSuccess("Login Successfull");
                          if(controller.isLoading_dash.isTrue)
                            controller
                              .isLoading_dash(!controller.isLoading_dash.value);
                          Get.toNamed('/dashbord');
                        }
                      },
                      text: "Login",
                      hight: 50,
                      width: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> loginMethod(BuildContext context) async {
    try {
      var response =
          await http.post(Uri.parse("${ApiRequests.login}"), headers: {
        'Accept': 'application/json',
      }, body: {
        'email': emailController,
        'password': passwordController
      });
      // print("${Userinformation.domain}/api/loginByEmail");
      var res = jsonDecode(response.body);
      status_login = response.statusCode;
      if (response.statusCode == 201) {
        ApiRequests.Token = res['token'];
        Securestorage storage = Securestorage();
        storage.save('token', ApiRequests.Token!);
       // EasyLoading.showSuccess(res['message']);
        // saveToken_partner(TokenPartner);
        print("${ApiRequests.Token}");
        print(response.statusCode);
      } else {
        EasyLoading.showError(res['message']);
        //toast(context, res['message']);
        print(res['message']);
        print(response.statusCode);
        print("noooo");
      }
    } catch (e) {
      print("erroorr");
      print(e);
      EasyLoading.showError(e.toString());
    }
  }
  // Future<void> loginMethod(BuildContext context) async {
  //   AuthProvider authProvider =
  //       Provider.of<AuthProvider>(context, listen: false);
  //   http.Response res =
  //       await ApiRequests.Login(emailController.text, passwordController.text);
  //   if (res.body.contains("id")) {
  //     Map<String, dynamic> info = json.decode(res.body);
  //     //String token = info['token'];
  //     String token = info['token'];
  //     print("$token");

  //     authProvider.setAuthToken(token);
  //     Pref pref = Pref();
  //     await pref.login(info);
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //       return Dashbord();
  //     }));
  //     /*  Fluttertoast.showToast(
  //         msg: res.body,
  //         backgroundColor: Colors.lightBlue,
  //         textColor: Colors.white,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 5);
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "login failed",
  //         backgroundColor: Colors.lightBlue,
  //         textColor: Colors.white,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 5);
  //   }
  // } */
  //     if (res.statusCode == 200 || res.statusCode == 201) {
  //       print("login succeded");
  //       print(res.body);
  //       print(res.statusCode);
  //       print("yess login");
  //       print(res);
  //     } else {
  //       print(" login failed");
  //       print(res.body);
  //       print(res.statusCode);
  //        print("noooo login");
  //       print(res);
  //     }
  //   }
  // }
}

Future<void> saveToken() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('token', '"136|naqROgeHNgTdU88TC4Vn29MXshjMV4hQDGWFQTVT"');
}
