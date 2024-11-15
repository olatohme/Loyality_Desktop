

import 'package:desktopapp/view/Add1.dart';
import 'package:desktopapp/view/Dashbord.dart';
import 'package:desktopapp/view/bundle_details.dart';
import 'package:desktopapp/view/detail_request.dart';
import 'package:desktopapp/view/login.dart';

import 'package:desktopapp/view/welcomm.dart';
import 'package:get/get.dart';



class route {
  static const Home = '/wel';
  static final routes = [

    GetPage(name: '/login', page: () => login()),
    GetPage(name: '/dashbord', page: () => Dashbord()),
    GetPage(name: '/add_bundl', page: () => Add1()),
    GetPage(name: '/wel', page: () => wel()),
    // GetPage(name: '/detail_req', page: () => detailsrequest()),
  ];
}
