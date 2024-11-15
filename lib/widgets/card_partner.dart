import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CardSubscribe extends StatelessWidget {
 //final  PartnerModel partner;
  const CardSubscribe();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () => Get.toNamed('/detailsPartner',),
        child: 
           Stack(children: [    Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                  //  image: DecorationImage(
                  //         image: NetworkImage(
                  //             "${Userinformation.domain}/${partner.imgUrl}"),
                          
                  //       ),
              ),
              
              width: 300,
              height: 200,
              //color: Colors.grey,
              margin: EdgeInsets.all(10),
                     ),
                     Positioned(
                      top:25,
                      left: 50,
                      child:  TextUtils(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            text: "" ,
            color: Colors.black,
            underLine: TextDecoration.none),)
                    ],
          
           ),
        ),
      
    ]);
  }
}
