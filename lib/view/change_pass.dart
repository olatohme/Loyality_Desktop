import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/contoller.dart';
import 'package:desktopapp/show_api.dart/api_dashboard.dart';
import 'package:desktopapp/widgets/button.dart';
import 'package:desktopapp/widgets/custom_textfield.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class change_pass extends StatelessWidget {
  change_pass({Key? key}) : super(key: key);
  var controller = Get.find<Dash_controller>();
  @override
  Widget build(BuildContext context) {
    final RxBool _obscureText = true.obs;
    final RxBool _obscureText1 = true.obs;
    final RxBool _obscureText2 = true.obs;
    return AlertDialog(
        //backgroundColor: Color.fromARGB(255, 225, 209, 228),
        content: SingleChildScrollView(
            child: Container(
                color: Colors.white70,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
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
                        width: 200,
                      ),
                      TextUtils(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          text: 'تغيير كلمة السر ',
                          color: Colors.black,
                          underLine: TextDecoration.none),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      width: 250,
                      child: Image.asset(
                        'assets/password.png',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 70, right: 70),
                        child: CustomTextField(
                          hintText: 'كلمة المرور القديمة',
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
                          hight: 60,
                          width: MediaQuery.of(context).size.width * 0.80,
                          keyboardType: TextInputType.text,
                          onchange: (value) {
                            controller.pass_old = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 70, right: 70),
                        child: CustomTextField(
                          hintText: ' كلمة المرور الحديثة',
                          prefixIcon: Text(""),
                          obscureText: _obscureText1.value,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _obscureText1.toggle();
                                print(_obscureText
                                    .value); // تبديل قيمة الـ RxBool بين true و false
                              },
                              child: Icon(
                                _obscureText1.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _obscureText1.value
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
                          hight: 60,
                          width: MediaQuery.of(context).size.width * 0.80,
                          keyboardType: TextInputType.text,
                          onchange: (value) {
                            controller.pass_new = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 70, right: 70),
                        child: CustomTextField(
                          hintText: 'تاكيد كلمة المرور',
                          prefixIcon: Text(""),
                          obscureText: _obscureText2.value,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _obscureText2.toggle();
                                print(_obscureText2
                                    .value); // تبديل قيمة الـ RxBool بين true و false
                              },
                              child: Icon(
                                _obscureText2.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _obscureText2.value
                                    ? kPrimaryColor
                                    : Colors.grey,
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a confirm password ';
                            }
                            if (value != controller.pass_new) {
                              return 'The password and its confirmation are not the same';
                            } else {
                              return null;
                            }
                          },
                          hight: 60,
                          width: MediaQuery.of(context).size.width * 0.80,
                          keyboardType: TextInputType.text,
                          onchange: (value) {
                            controller.pass_confirm = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Button(
                      onPressed: () async {
                        EasyLoading.show(status: "Loading...");
                        await controller.update_pass(ApiRequests.Token!);
                        if (controller.status_edit_pass == 200 ||
                            controller.status_edit_pass == 201) Get.back();
                      },
                      text: "Change",
                      hight: 50,
                      width: 200,
                    ),
                  ],
                ))));
  }
}
