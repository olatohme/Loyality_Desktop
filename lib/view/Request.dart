// import 'package:desktopapp/consts/colors.dart';
// import 'package:desktopapp/contoller.dart';
// import 'package:desktopapp/view/detail_request.dart';
// import 'package:desktopapp/widgets/cardrequest.dart';
// import 'package:desktopapp/widgets/text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../Detiels.dart';

// class Request extends StatelessWidget {
//   Request({Key? key}) : super(key: key);
//   var controller = Get.find<Dash_controller>();

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//         //backgroundColor: Color.fromARGB(255, 225, 209, 228),
//         content:
//         // SingleChildScrollView(
//          // child:
//          Container(
//       color: Colors.white70,
//       height: MediaQuery.of(context).size.height*0.9,
//       width: MediaQuery.of(context).size.width * 0.4,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               SizedBox(
//                 width: 10,
//               ),
//               IconButton(
//                 onPressed: () {
//                   // print(l.requests[0].id);
//                   // print(l.requests[0].userId);
//                   // print(l.requests[0].status);
//                   // print(l.requests[0].createdAt);
//                   // controller.isLoading_request(!controller.isLoading_request.value);
//                   Get.back();
//                 },
//                 icon: Icon(Icons.arrow_back_sharp),
//                 color: black,
//                 iconSize: 40,
//               ),
//               SizedBox(
//                 width: 150,
//               ),
//               TextUtils(
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                   // text:
//                   //     "Phone is: ${l.user.phoneNumber.toString()}",
//                   text: ": طلبات الاشتراك ",
//                   color: Colors.black,
//                   underLine: TextDecoration.none),
//             ],
//           ),
//           controller.requests.length == 0
//               ? SizedBox(
//                   height: 400,
//                   child: Center(
//                     child: TextUtils(
//                         fontSize: 18,
//                         fontWeight: FontWeight.normal,
//                         text: "لا يوجد طلبات اشتراك    ",
//                         // text: "name is: Adidas",
//                         color: Colors.black,
//                         underLine: TextDecoration.none),
//                   ))
//               : SizedBox(height: 20),
//           Obx(() {
//             if (controller.isLoading_request.isTrue) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return SingleChildScrollView(
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height ,

//                 child: ListView.separated(
//                   itemBuilder: (context, index) {
//                     // return InkWell(
//                     //   onTap: () {
//                     //     showDialog(
//                     //         context: context,
//                     //         builder: (context) =>
//                     //             detailsrequest(controller.requests[index]));
//                     //   },
//                     return cardrequest(controller.requests[index]);
//                     //Card(
//                     //     elevation: 30,
//                     //     shadowColor: kPrimaryColor.withOpacity(0.2),
//                     //     child: Column(children: [
//                     //       SizedBox(
//                     //         height: 5,
//                     //       ),
//                     //       TextUtils(
//                     //           fontSize: 18,
//                     //           fontWeight: FontWeight.normal,
//                     //           text:
//                     //               "Name is :${controller.requests[index].user.fname} ${controller.requests[index].user.lname} ",
//                     //           // text: "name is: Adidas",
//                     //           color: Colors.black,
//                     //           underLine: TextDecoration.none),
//                     //       TextUtils(
//                     //           fontSize: 18,
//                     //           fontWeight: FontWeight.normal,
//                     //           text: " ${controller.requests[index].createdAt}",
//                     //           // text: "name is: Adidas",
//                     //           color: Colors.black,
//                     //           underLine: TextDecoration.none),
//                     //     ])),
//                   },
//                   separatorBuilder: (context, index) => const SizedBox(
//                   //  height: 20,
//                   ),
//                   itemCount: controller.requests.length,
//                 ),
//               ),
//             );
//           })
//         ],
//       ),
//       // })
//       //   ],
//       // )
//     ));
//   }

//   // Widget cardrequest(int index, BuildContext context) {
//   //   return InkWell(
//   //     onTap: () {
//   //       showDialog(
//   //           context: context,
//   //           builder: (context) => detailsrequest(controller.requests[index]));
//   //     },
//   //     child: Stack(
//   //       children: [
//   //         Container(
//   //           child: Column(
//   //             mainAxisAlignment: MainAxisAlignment.start,
//   //             children: [
//   //               SizedBox(
//   //                 height: 5,
//   //               ),
//   //               TextUtils(
//   //                   fontSize: 18,
//   //                   fontWeight: FontWeight.normal,
//   //                   text:
//   //                       "Name is :${controller.requests[index].user.fname} ${controller.requests[index].user.lname} ",
//   //                   // text: "name is: Adidas",
//   //                   color: Colors.black,
//   //                   underLine: TextDecoration.none),
//   //               SizedBox(
//   //                 height: 5,
//   //               ),
//   //               TextUtils(
//   //                   fontSize: 18,
//   //                   fontWeight: FontWeight.normal,
//   //                   text: " ${controller.requests[index].createdAt}",
//   //                   //  text: "phone is: 0932456789",
//   //                   color: Colors.black,
//   //                   underLine: TextDecoration.none),
//   //               SizedBox(
//   //                 height: 5,
//   //               ),

//   //               // controller.requeest!.requests[index].status == null
//   //               //     ? Button(
//   //               //         onPressed: () async {
//   //               //           print(
//   //               //               " ${controller.requeest!.requests[index].id.toString()}");
//   //               //           //print(" ${[index].id.toString()}");
//   //               //           Get.toNamed('/editrequest',
//   //               //               arguments: controller.requeest!.requests[index].id);
//   //               //         },
//   //               //         text: "تعديل",
//   //               //         hight: 40,
//   //               //         width: 90,
//   //               //       )
//   //               //     : TextUtils(
//   //               //         fontSize: 18,
//   //               //         fontWeight: FontWeight.normal,
//   //               //         //text: "status is: Pending}",
//   //               //         text: "",
//   //               //         color: Colors.white,
//   //               //         underLine: TextDecoration.none),
//   //               // controller.requeest!.requests[index].status == null
//   //               //     ? Button(
//   //               //         onPressed: () {
//   //               //           openDialog(context,index);
//   //               //         },
//   //               //         text: "حذف ",
//   //               //         hight: 40,
//   //               //         width: 90,
//   //               //       )
//   //               //     : TextUtils(
//   //               //         fontSize: 18,
//   //               //         fontWeight: FontWeight.normal,
//   //               //         //text: "status is: Pending}",
//   //               //         text: "",
//   //               //         color: Colors.white,
//   //               //         underLine: TextDecoration.none),
//   //             ],
//   //           ),
//   //           decoration: BoxDecoration(
//   //             color: Colors.white,
//   //             borderRadius: BorderRadius.only(
//   //               topLeft: Radius.circular(30),
//   //               topRight: Radius.circular(30),
//   //               bottomLeft: Radius.circular(30),
//   //               bottomRight: Radius.circular(30),
//   //             ),
//   //             boxShadow: [
//   //               BoxShadow(
//   //                 color: Color(0x7f000000),
//   //                 blurRadius: 4,
//   //                 // spreadRadius: 4,
//   //                 offset: Offset(0, 4),
//   //               ),
//   //             ],
//   //           ),
//   //           width: 300,
//   //           height: 100,
//   //           //color: Colors.grey,
//   //           margin: EdgeInsets.all(10),
//   //         ),
//   //         Positioned(
//   //           top: 10,
//   //           left: 10,
//   //           child: Container(
//   //             width: 70,
//   //             height: 70,
//   //             decoration: BoxDecoration(
//   //               color: kPrimaryColor,
//   //               borderRadius: BorderRadius.only(
//   //                 topLeft: Radius.circular(30),
//   //                 topRight: Radius.circular(0),
//   //                 bottomLeft: Radius.circular(0),
//   //                 bottomRight: Radius.circular(180),
//   //               ),
//   //             ),
//   //             child: Center(
//   //               child: TextUtils(
//   //                   fontSize: 15,
//   //                   fontWeight: FontWeight.bold,
//   //                   text: "${index + 1}",
//   //                   // text:
//   //                   //     "Status is: ${status(index)}",
//   //                   color: Colors.white,
//   //                   underLine: TextDecoration.none),
//   //             ),
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }

// }
import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/contoller.dart';
import 'package:desktopapp/widgets/cardrequest.dart';
import 'package:desktopapp/widgets/carduser.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Request extends StatelessWidget {
  Request({Key? key}) : super(key: key);
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
                      width: 50,
                    ),
                    TextUtils(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        text: 'عرض طلبات الاشتراك    ',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                         SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () async {
                          controller
                        .isLoading_request(!controller.isLoading_request.value);
                        controller.requests =
                        
                           await controller.GetRequests(ApiRequests.Token!);
                             controller
                        .isLoading_request(!controller.isLoading_request.value);
                      },
                      icon: Icon(Icons.refresh),
                      iconSize: 40,
                      color: Colors.black,
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    if (controller.isLoading_request.isTrue) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return cardrequest(controller.requests[index]);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                          itemCount: controller.requests.length,
                        ),
                      ),
                    );
                  }),
                ]))));
  }
}
