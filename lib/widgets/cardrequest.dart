import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/model.dart/partner_model.dart';
import 'package:desktopapp/model.dart/request_model.dart';
import 'package:desktopapp/model.dart/users_model.dart';
import 'package:desktopapp/view/detail_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contoller.dart';

class cardrequest extends StatelessWidget {
  
  RequestsModel req;
  cardrequest(this.req);
  var controller = Get.find<Dash_controller>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {  showDialog(
                          context: context,
                          builder: (context) =>
                              detailsrequest(req));},
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 170,
              width: 150,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      "${controller.baseurl_img}${req.user.imgUrl}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Name is :${req.user.fname} ${req.user.lname} ",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                     " ${req.createdAt}",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
