
import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/model.dart/segmentation_model.dart';
import 'package:desktopapp/view/change_pass.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/contoller.dart';
import 'package:desktopapp/view/command.dart';
import 'package:desktopapp/view/convert.dart';
import 'package:desktopapp/view/detail_request.dart';
import 'package:desktopapp/view/editsegmentation.dart';
import 'package:desktopapp/view/login.dart';
import 'package:desktopapp/show_api.dart/api_dashboard.dart';
import 'package:desktopapp/view/Add1.dart';
import 'package:desktopapp/view/partners.dart';
import 'package:desktopapp/view/users.dart';
import 'package:desktopapp/widgets/card1.dart';
import 'package:desktopapp/widgets/card2.dart';
import 'package:desktopapp/widgets/card_bundle.dart';
import 'package:desktopapp/widgets/card_value.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'Request.dart';

class Dashbord extends StatefulWidget {
  Dashbord({Key? key}) : super(key: key);

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  var controller = Get.find<Dash_controller>();
  bool isclick_add = false;
  bool isclick_req = false;
  bool isclick_change = false;
  bool isclick_user = false;
  bool isclick_partner = false;
  bool isclick_convert = false;
  bool isclick_system = false;
  bool isclick_logout = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kPrimaryColor,
      // ),
      body: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Column(children: [
            // SizedBox(height: 70,
            // child: Row(children: [
            //    Image.asset(
            //       'assets/wloy.png',
            //       height: 100,
            //       width: 100,
            //     ),],

            // ),),
            // SizedBox(
            //   height: 70,
            //   child: Row(children: [
            //     // Image.asset(
            //     //   'assets/bundl.png',
            //     //   height: 100,
            //     //   width: 200,
            //     // ),
            //   ]),
            // ),
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              // color: kPrimaryColor,
              width: 250,
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                // Divider(
                //   color: Colors.white,
                //   height: 3,
                // ),
                IconButton(
                  onPressed: () async {
                    controller.isLoading_dash(!controller.isLoading_dash.value);
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
                    print("${Api.bundles.length}");
                  },
                  icon: Icon(Icons.refresh),
                  iconSize: 40,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isclick_add = true;
                      isclick_change = false;
                      isclick_req = false;
                      isclick_user = false;
                      isclick_partner = false;
                      isclick_logout == false;
                      isclick_convert = false;
                      isclick_system = false;
                      showDialog(
                          context: context, builder: (context) => Add1());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                          width: 2,
                        ),
                        color: isclick_add == true ? white : kPrimaryColor),
                    width: 250,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.add_box_rounded,
                            color: isclick_add == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 25,
                        ),
                        TextUtils(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            text: 'Add Bundle',
                            color: isclick_add == true ? kPrimaryColor : white,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    setState(() {
                      isclick_add = false;
                      isclick_change = true;
                      isclick_req = false;
                      isclick_user = false;
                      isclick_partner = false;
                      isclick_logout == false;
                      isclick_convert = false;
                      isclick_system = false;
                      showDialog(
                          context: context,
                          builder: (context) => change_pass());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                          width: 2,
                        ),
                        color: isclick_change == true ? white : kPrimaryColor),
                    width: 250,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.lock_outline,
                            color:
                                isclick_change == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 25,
                        ),
                        TextUtils(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            text: 'Change Password',
                            color:
                                isclick_change == true ? kPrimaryColor : white,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isclick_add = false;
                      isclick_change = false;
                      isclick_req = true;
                      isclick_user = false;
                      isclick_partner = false;
                      isclick_logout == false;
                      isclick_convert = false;
                      isclick_system = false;
                      showDialog(
                          context: context, builder: (context) => Request());
                      // showDialog(
                      //       context: context, builder: (context) => detailsrequest());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                          width: 2,
                        ),
                        color: isclick_req == true ? white : kPrimaryColor),
                    width: 250,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.list,
                            color: isclick_req == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 25,
                        ),
                        TextUtils(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            text: 'Show Requests',
                            color: isclick_req == true ? kPrimaryColor : white,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isclick_add = false;
                      isclick_change = false;
                      isclick_req = false;
                      isclick_user = true;
                      isclick_partner = false;
                      isclick_logout == false;
                      isclick_convert = false;
                      isclick_system = false;

                      showDialog(
                          context: context, builder: (context) => users());
                      // showDialog(
                      //       context: context, builder: (context) => detailsrequest());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                          width: 2,
                        ),
                        color: isclick_user == true ? white : kPrimaryColor),
                    width: 250,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.person,
                            color:
                                isclick_user == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 25,
                        ),
                        TextUtils(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            text: 'Show Users',
                            color: isclick_user == true ? kPrimaryColor : white,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isclick_add = false;
                      isclick_change = false;
                      isclick_req = false;
                      isclick_user = false;
                      isclick_partner = true;
                      isclick_logout == false;
                      isclick_convert = false;
                      isclick_system = false;
                      showDialog(
                          context: context, builder: (context) => partners());
                      // showDialog(
                      //       context: context, builder: (context) => detailsrequest());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                          width: 2,
                        ),
                        color: isclick_partner == true ? white : kPrimaryColor),
                    width: 250,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.group,
                            color: isclick_partner == true
                                ? kPrimaryColor
                                : white),
                        SizedBox(
                          width: 25,
                        ),
                        TextUtils(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            text: 'Show Partners',
                            color:
                                isclick_partner == true ? kPrimaryColor : white,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isclick_add = false;
                      isclick_change = false;
                      isclick_req = false;
                      isclick_user = false;
                      isclick_partner = false;
                      isclick_logout == false;
                      isclick_convert = true;
                      isclick_system = false;
                      showDialog(
                          context: context, builder: (context) => convert());
                      // showDialog(
                      //       context: context, builder: (context) => detailsrequest());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                          width: 2,
                        ),
                        color: isclick_convert == true ? white : kPrimaryColor),
                    width: 250,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.games_outlined,
                            color: isclick_convert == true
                                ? kPrimaryColor
                                : white),
                        SizedBox(
                          width: 25,
                        ),
                        TextUtils(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            text: 'Record convert',
                            color:
                                isclick_convert == true ? kPrimaryColor : white,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isclick_add = false;
                      isclick_change = false;
                      isclick_req = false;
                      isclick_user = false;
                      isclick_partner = false;
                      isclick_logout == false;
                      isclick_convert = false;
                      isclick_system = true;
                      showDialog(
                          context: context, builder: (context) => command());
                      // showDialog(
                      //       context: context, builder: (context) => detailsrequest());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                          width: 2,
                        ),
                        color: isclick_system == true ? white : kPrimaryColor),
                    width: 250,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.games_outlined,
                            color:
                                isclick_system == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 25,
                        ),
                        TextUtils(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            text: 'System operation',
                            color:
                                isclick_system == true ? kPrimaryColor : white,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      isclick_add = false;
                      isclick_change = false;
                      isclick_req = false;
                      isclick_user = false;
                      isclick_partner = false;
                      isclick_logout == true;
                      isclick_convert = false;
                      isclick_system = false;
                      EasyLoading.show(status: "Loading...");
                      // showDialog(
                      //     context: context, builder: (context) => convert());
                      // showDialog(
                      //       context: context, builder: (context) => detailsrequest());
                    });
                    await controller.Logout(ApiRequests.Token!);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                          width: 2,
                        ),
                        color: isclick_logout == true ? white : kPrimaryColor),
                    width: 250,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.logout,
                            color:
                                isclick_logout == true ? kPrimaryColor : white),
                        SizedBox(
                          width: 25,
                        ),
                        TextUtils(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            text: 'Logout',
                            color:
                                isclick_logout == true ? kPrimaryColor : white,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ]),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              //
              SizedBox(
                height: 70,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/dash.png',
                        height: 100,
                        width: 200,
                      ),
                      TextUtils(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          text:
                              '                                                      ',
                          color: white,
                          underLine: TextDecoration.none),
                      TextUtils(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          text:
                              '                                                       ',
                          color: white,
                          underLine: TextDecoration.none),
                    ]),
              ),

              Obx(() {
                if (controller.isLoading_dash.isTrue) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => edit_segment(
                                  "gold1", controller.segment[0].id));
                        },
                        child:
                            cardsegmentation(controller.segment[0], "gold1")),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => edit_segment(
                                "silver1", controller.segment[1].id));
                      },
                      child: cardsegmentation(controller.segment[1], "silver1"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => edit_segment(
                                "bronze1", controller.segment[2].id));
                      },
                      child: cardsegmentation(controller.segment[2], "bronze1"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                edit_segment("new", controller.segment[3].id));
                      },
                      child: cardsegmentation(controller.segment[3], "new"),
                    )
                  ],
                );
                // return SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.35,
                //   width: MediaQuery.of(context).size.width * 0.5,
                //   child: ListView.separated(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return cardBundle(
                //         Api.bundles[index]);
                //       },
                //       separatorBuilder: (context, index) => const SizedBox(
                //             width: 0,
                //           ),
                //       itemCount:
                //       Api.bundles.length ,
                //       ),
                // );
                // SizedBox(height: 30,)
              }),
              SizedBox(
                height: 30,
              ),
              Obx(() {
                if (controller.isLoading_dash.isTrue) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Row(
                  children: [
                    card1("Users", 27),
                    card1("Partners", 12),
                    card1("Bundes", 5),
                  ],
                );
              }),
              SizedBox(
                height: 30,
              ),
              Obx(() {
                if (controller.isLoading_dash.isTrue) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Row(
                  children: [
                    card2("The number of conversions", "points into gems", 15),
                    SizedBox(
                      width: 20,
                    ),
                    card2("The number of conversions", "gems into cash", 10),
                  ],
                );
              }),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Obx(() {
            if (controller.isLoading_dash.isTrue) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                SizedBox(
                  height: 70,
                  child: Row(children: [
                    Image.asset(
                      'assets/bundl.png',
                      height: 100,
                      width: 200,
                    ),
                  ]),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return cardBundle(Api.bundles[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemCount: Api.bundles.length,
                    ),
                  ),
                ),
                TextUtils(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    text: 'Default Values',
                    color: kPrimaryColor,
                    underLine: TextDecoration.none),
                Obx(() {
                  if (controller.isLoading_dash.isTrue) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return cardValue(controller.values[index]);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                        itemCount: controller.values.length,
                      ),
                    ),
                  );
                })
              ],
            );
          })
        ],
      ),
    );
  }

  Widget cardsegmentation(SegmentationModel S, String image) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        height: 280,
        width: 170,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: '${S.name} _ ${S.type}',
              color: Colors.red.shade900,
              underLine: TextDecoration.none),
          SizedBox(
            height: 10,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: '${S.gems} gems',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 10,
          ),
               TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: '${S.offerMaxBonus} offerMaxBonus',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 10,
          ),
               TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: '${S.offerMaxGems} offerMaxGems',
              color: black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 10,
          ),
          TextUtils(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              text: '${S.period} day',
              color: black,
              underLine: TextDecoration.none),
          S.relation == 1
              ? TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: ' gems and the period',
                  color: black,
                  underLine: TextDecoration.none)
              : TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: ' gems or the period',
                  color: black,
                  underLine: TextDecoration.none),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/${image}.png',
            width: 60,
            height: 60,
          ),
        ]));
  }
}
