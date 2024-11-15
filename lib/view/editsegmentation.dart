import 'dart:convert';

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
import 'package:http/http.dart' as http;

class edit_segment extends StatefulWidget {
  edit_segment(this.image, this.id);

  String image;
  int id;
  @override
  State<edit_segment> createState() => _edit_segmentState(image, id);
}

class _edit_segmentState extends State<edit_segment> {
  String image;
  int id;
  var controller = Get.find<Dash_controller>();
  var name = "";
  var type = "";
  var gems = "";
  var period = "";
  var relation = "";
  var offermaxbonus = "";
  var offermaxgems = "";
  String selectedValue = 'Both'; // القيمة المختارة الافتراضية

  List<String> options = ['Both', 'One of Them'];
  _edit_segmentState(this.image, this.id);
  @override
  Widget build(BuildContext context) {
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
                        width: 40,
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
                          text: 'تعديل معلومات شريحة',
                          color: Colors.black,
                          underLine: TextDecoration.none),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/${image}.png',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: CustomTextField(
                        hintText: 'gems ',
                        prefixIcon: Text(""),
                        obscureText: false,
                        suffixIcon:
                            const Icon(Icons.person, color: Colors.grey),
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
                        hintText: 'period ',
                        prefixIcon: Text(""),
                        obscureText: false,
                        suffixIcon:
                            const Icon(Icons.person, color: Colors.grey),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a name';
                          }
                        },
                        hight: 60,
                        width: MediaQuery.of(context).size.width * 0.80,
                        keyboardType: TextInputType.emailAddress,
                        onchange: (value) {
                          period = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: CustomTextField(
                        hintText: 'OfferMaxGems ',
                        prefixIcon: Text(""),
                        obscureText: false,
                        suffixIcon:
                            const Icon(Icons.person, color: Colors.grey),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a name';
                          }
                        },
                        hight: 60,
                        width: MediaQuery.of(context).size.width * 0.80,
                        keyboardType: TextInputType.emailAddress,
                        onchange: (value) {
                          offermaxgems = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: CustomTextField(
                        hintText: 'OfferMaxBonus ',
                        prefixIcon: Text(""),
                        obscureText: false,
                        suffixIcon:
                            const Icon(Icons.person, color: Colors.grey),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a name';
                          }
                        },
                        hight: 60,
                        width: MediaQuery.of(context).size.width * 0.80,
                        keyboardType: TextInputType.emailAddress,
                        onchange: (value) {
                          offermaxbonus = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 50, right: 50),
                    //   child: CustomTextField(
                    //     hintText: 'relation ',
                    //     prefixIcon: Text(""),
                    //     obscureText: false,
                    //     suffixIcon:
                    //         const Icon(Icons.person, color: Colors.grey),
                    //     validator: (value) {
                    //       if (value.isEmpty) {
                    //         return 'Please enter a name';
                    //       }
                    //     },
                    //     hight: 60,
                    //     width: MediaQuery.of(context).size.width * 0.80,
                    //     keyboardType: TextInputType.emailAddress,
                    //     onchange: (value) {
                    //       relation = value;
                    //     },
                    //   ),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                      onPressed: () async {
                          EasyLoading.show(status: "Loading...");
                        await editsegment(ApiRequests.Token!);
                        if (controller.status_upsegment == 200 ||
                            controller.status_upsegment == 201)
                          controller
                              .isLoading_dash(!controller.isLoading_dash.value);
                        Get.back();
                      },
                      text: "تعديل ",
                      hight: 50,
                      width: 200,
                    ),
                  ],
                ))));
  }

  Future<void> editsegment(String token) async {
    try {
      if (selectedValue == "Both") relation = "1";else  relation = "0";
      print("token is  ${ApiRequests.Token}");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${ApiRequests.Token}'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${controller.baseurl}segmentations/${id}'));
      request.fields.addAll({
        "period": period,
        "gems": gems,
        "relation": relation,
        "offerMaxBonus": offermaxbonus,
        "offerMaxGems": offermaxgems
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
      controller.status_upsegment = response.statusCode;
      if (response.statusCode == 201 || response.statusCode == 200) {
        controller.segment =
            await controller.GetSegmentation(ApiRequests.Token!);
        controller.isLoading_dash(!controller.isLoading_dash.value);
EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print(response.statusCode);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk  editsegm");

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
        print("not okkk editseg");
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

// class edit_segment extends StatelessWidget {
//   String selectedValue = 'Option 1'; // القيمة المختارة الافتراضية

//   List<String> options = ['Option 1', 'Option 2',];
//   String image;
//   int id;
//   edit_segment(this.image, this.id);
//   var controller = Get.find<Dash_controller>();
//   var name = "";
//   var type = "";
//   var gems = "";
//   var period = "";
//   var relation = "";
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//         //backgroundColor: Color.fromARGB(255, 225, 209, 228),
//         content: SingleChildScrollView(
//             child: Container(
//                 color: Colors.white70,
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width * 0.4,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(children: [
//                       SizedBox(
//                         width: 40,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         icon: Icon(Icons.arrow_back_sharp),
//                         color: black,
//                         iconSize: 40,
//                       ),
//                       SizedBox(
//                         width: 200,
//                       ),
//                       TextUtils(
//                           fontSize: 17,
//                           fontWeight: FontWeight.normal,
//                           text: 'تعديل معلومات شريحة',
//                           color: Colors.black,
//                           underLine: TextDecoration.none),
//                     ]),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       height: 150,
//                       width: 150,
//                       child: Image.asset(
//                         'assets/${image}.png',
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
                   
                   
//                     Padding(
//                       padding: const EdgeInsets.only(left: 50, right: 50),
//                       child: CustomTextField(
//                         hintText: 'gems ',
//                         prefixIcon: Text(""),
//                         obscureText: false,
//                         suffixIcon:
//                             const Icon(Icons.person, color: Colors.grey),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter a name';
//                           }
//                         },
//                         hight: 60,
//                         width: MediaQuery.of(context).size.width * 0.80,
//                         keyboardType: TextInputType.emailAddress,
//                         onchange: (value) {
//                           gems = value;
//                         },
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 50, right: 50),
//                       child: CustomTextField(
//                         hintText: 'period ',
//                         prefixIcon: Text(""),
//                         obscureText: false,
//                         suffixIcon:
//                             const Icon(Icons.person, color: Colors.grey),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter a name';
//                           }
//                         },
//                         hight: 60,
//                         width: MediaQuery.of(context).size.width * 0.80,
//                         keyboardType: TextInputType.emailAddress,
//                         onchange: (value) {
//                           period = value;
//                         },
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//         //              DropdownButton<String>(
//         //   value: selectedValue,
//         //   onChanged: (String newValue) {
//         //     setState(() {
//         //       selectedValue = newValue;
//         //     });
//         //   },
//         //   items: options.map<DropdownMenuItem<String>>((String value) {
//         //     return DropdownMenuItem<String>(
//         //       value: value,
//         //       child: Text(value),
//         //     );
//         //   }).toList(),
//         // ),
//         //             
//         Padding(
//                       padding: const EdgeInsets.only(left: 50, right: 50),
//                       child: CustomTextField(
//                         hintText: 'relation ',
//                         prefixIcon: Text(""),
//                         obscureText: false,
//                         suffixIcon:
//                             const Icon(Icons.person, color: Colors.grey),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter a name';
//                           }
//                         },
//                         hight: 60,
//                         width: MediaQuery.of(context).size.width * 0.80,
//                         keyboardType: TextInputType.emailAddress,
//                         onchange: (value) {
//                           relation = value;
//                         },
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Button(
//                       onPressed: () async {
//                         await editsegment(ApiRequests.Token!);
//                         if (controller.status_upsegment == 200 ||
//                             controller.status_upsegment == 201)
//                           controller
//                               .isLoading_dash(!controller.isLoading_dash.value);
//                         Get.back();
//                       },
//                       text: "تعديل ",
//                       hight: 50,
//                       width: 200,
//                     ),
//                   ],
//                 ))));
//   }

//   Future<void> editsegment(String token) async {
//     try {
//       print("token is  ${ApiRequests.Token}");
//       var headers = {
//         'Accept': 'application/json',
//         'Authorization': 'Bearer ${ApiRequests.Token}'
//       };
//       var request = http.MultipartRequest(
//           'POST', Uri.parse('${controller.baseurl}segmentations/${id}'));
//       request.fields.addAll({
       
//         "period": period,
       
//         "gems": gems,
//         "relation": relation
//       });

//       request.headers.addAll(headers);

//       http.StreamedResponse response = await request.send();
//       String responseBody = await response.stream.bytesToString();
//       var res = jsonDecode(responseBody);
//       controller.status_upsegment = response.statusCode;
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         controller.segment =
//             await controller.GetSegmentation(ApiRequests.Token!);
//         controller.isLoading_dash(!controller.isLoading_dash.value);

//         print(response.statusCode);
//         print(jsonDecode(responseBody)['message']);
//         print("okkkkk  editsegm");

//         // toast(context, jsonDecode(responseBody)['message']);

//         // productList = await showprod();
//         // print(isloading);
//         // isloading(!isloading.value);
//         // print(isloading);
//       } else {
//         // EasyLoading.showError(jsonDecode(responseBody)['message']);
//         //  toast(context, jsonDecode(responseBody)['message']);
//         // print(token);
//         print(res['message']);
//         print(response.statusCode);
//         print("not okkk editseg");
//         print(response.request);
//         // update();
//       }
//     } catch (e) {
//       // EasyLoading.showError(e.toString());
//       print("errrorrr");
//       print(e);
//     }
//   }
// }
