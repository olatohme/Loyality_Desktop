import 'package:desktopapp/consts/colors.dart';
import 'package:desktopapp/model.dart/command_model.dart';
import 'package:desktopapp/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contoller.dart';

class command extends StatelessWidget {
  command({Key? key}) : super(key: key);
  var controller = Get.find<Dash_controller>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SingleChildScrollView(
            child: Container(
                color: Colors.white70,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width*0.9,
                child:  Column(
                  children: [
                    Table(
                        border: TableBorder.all(),
                        children: [
                           TableRow(children: [
                             TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      text: "id\n",
                                      color: black,
                                      maxline: 2,
                                      underLine: TextDecoration.none),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      text: "Name",
                                      color: black,
                                       maxline: 2,
                                      underLine: TextDecoration.none),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      text: "action",
                                      color: black,
                                       maxline: 2,
                                      underLine: TextDecoration.none),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      text: "value",
                                      color: black,
                                       maxline: 2,
                                      underLine: TextDecoration.none),
                                ),),
                                    TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      text: "createdAt",
                                       maxline: 2,
                                      color: black,
                                      underLine: TextDecoration.none),
                                ),
                              ),
                           ]),
                          for (CommandModel row in controller.command)
                            TableRow(children: [
                              TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text: " ${row.id}",
                                      color: black,
                                      underLine: TextDecoration.none),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text: " ${row.commandName}",
                                      color: black,
                                      underLine: TextDecoration.none),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text: "  ${row.action}\n",
                                      color: black,
                                      maxline: 3,
                                      underLine: TextDecoration.none),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text: " ${row.value}",
                                      color: black,
                                      underLine: TextDecoration.none),
                                ),),
                                    TableCell(
                                child: Center(
                                  child: TextUtils(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      text: " ${row.createdAt}",
                                      color: black,
                                      underLine: TextDecoration.none),
                                ),
                              ),
                              
                            ])
                        ],
                    
                    ),
                  ],
                ))));
  }
}
