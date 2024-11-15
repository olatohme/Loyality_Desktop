import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'custom_textfield.dart';

class card extends StatelessWidget {
 

  card();
//var controller=Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(180),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(150),
            ),
          ),
          width: 290,
          height: 600,
          //color: Colors.grey,
          margin: EdgeInsets.all(10),
        ),
        Positioned(
          left: 30,
          top: 25,
          child: Container(
            width: 250,
            height: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                // TextUtils(
                //     fontSize: 30,
                //     fontWeight: FontWeight.bold,
                //     text: B.name,
                //     color: Colors.red.shade900,
                //     underLine: TextDecoration.none),
                // SizedBox(
                //   height: 5,
                // ),
    //             TextUtils(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.normal,
    //                 text: "Gems is: ${B.gems}",
    //                 color: Colors.red.shade900,
    //                 underLine: TextDecoration.none),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             TextUtils(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.normal,
    //                 text: "Bonus is:${B.bonus}",
    //                 color: Colors.red.shade900,
    //                 underLine: TextDecoration.none),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             TextUtils(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.normal,
    //                 text: "price is :${B.price}",
    //                 color: kPrimaryColor,
    //                 underLine: TextDecoration.none),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             TextUtils(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.normal,
    //                 text: 'Period is :${B.expirationPeriod}',
    //                 color: Colors.green,
    //                 underLine: TextDecoration.none),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             TextUtils(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.normal,
    //                 text: 'golden_offers :${B.goldenOffersNumber}',
    //                 color: black,
    //                 underLine: TextDecoration.none),
    //                  SizedBox(
    //               height: 5,
    //             ),
    //             TextUtils(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.normal,
    //                 text: 'silver_offers :${B.silverOffersNumber}',
    //                 color: black,
    //                 underLine: TextDecoration.none),
    //                  SizedBox(
    //               height: 5,
    //             ),
    //             TextUtils(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.normal,
    //                 text: 'bronze_offers :${B.bronzeOffersNumber}',
    //                 color: black,
    //                 underLine: TextDecoration.none),
    //                  SizedBox(
    //               height: 5,
    //             ),
    //             TextUtils(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.normal,
    //                 text: 'new_offers :${B.newOffersNumber}',
    //                 color: black,
    //                 underLine: TextDecoration.none),
    //                   SizedBox(
    //               height: 5,
    //             ),
    //             InkWell(
    //               onTap: (){
    //               //  openDialog(context);
    //                 },
    //               child: Container(
    //                 child: Center(
    //                   child: TextUtils(
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.normal,
    //                       text: 'اشتراك',
    //                       color: white,
    //                       underLine: TextDecoration.none),
    //                 ),
    //                 width: 100,
    //                 height: 80,
    //                 decoration: BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   color: kPrimaryColor,
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(150),
    //             topRight: Radius.circular(0),
    //             bottomLeft: Radius.circular(0),
    //             bottomRight: Radius.circular(110),
    //           ),
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       bottom: 30,
    //       left: 30,
    //       child: Container(
    //         width: 130,
    //         height: 35,
    //         color: Colors.white,
    //         child: Center(
    //           child: TextUtils(
    //               fontSize: 24,
    //               fontWeight: FontWeight.bold,
    //               text: B.name,
    //               color: kPrimaryColor,
    //               underLine: TextDecoration.none),
       ] )
          ),
        ),
      ],
    );
  }
//   void openDialog(BuildContext context) {
//    // controller.isDialogOpen.value = true;
//     Get.dialog(
//       AlertDialog(
//         titlePadding: EdgeInsets.only(top: 30,left: 190),
//         title: TextUtils(
//                             fontSize: 17,
//                             fontWeight: FontWeight.normal,
//                             text: "اشتراك بالباقة",
//                             color: Colors.black,
//                             underLine: TextDecoration.none),
        
//         content: CustomTextField(
//           hintText: 'رابط حساب البنك',
//           prefixIcon: Text(""),
//           suffixIcon: Text(""),
//           validator: (value) {},
//           hight: 60,
//           width: MediaQuery.of(context).size.width * 0.70,
//           keyboardType: TextInputType.number,
//           onchange: (value) {
//           //  controller.bankapi.value = value;
//           }, obscureText: false,
//         ),
//         actions: [
//           Center(
//             child: Button(
//               onPressed: () {
//                 controller.isDialogOpen.value = false;
//                 Get.back();
//               },
//               text: "اشتراك",
//               hight: 50,
//               width: 200,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           )
//         ],
//       ),
//       barrierDismissible: false,
//     );
//   }
}
