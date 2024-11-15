import 'dart:convert';

import 'package:desktopapp/contoller.dart';
import 'package:desktopapp/model.dart/bundle_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api_requests.dart';

class Api{
   static var status_bundles;
  static var status_delbund;
static List<BundlesModel> bundles = [];
static var controller = Get.find<Dash_controller>();
  static Future<List<BundlesModel>> GetBundles(
       String token) async {
    try {
      print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${ApiRequests.baseurl}admin/Show_Bundles'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
       status_bundles = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get bundle");
        print(response.statusCode);
        var res = bundlesModelFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo get bundle");
         //EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
 static Future DeleteBundle(String token, int idoffer) async {
    try {
      //  print("token is :$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'DELETE', Uri.parse('${ApiRequests.del_bundle}${idoffer}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);
status_delbund=response.statusCode;
      
      //json.decode(response.body);
      //jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
       Api.bundles = await Api.GetBundles(ApiRequests.Token!);
         controller.isLoading_dash(
                                  !controller.isLoading_dash.value);
        print("yesss delete");
        print(response.statusCode);
        print(res);
        //  print(res[1].title);

      } else {
        
        print("nooo delete");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print("erroorr");
     
    }
  }

}

