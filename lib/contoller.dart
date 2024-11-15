import 'dart:convert';

import 'package:desktopapp/api_requests.dart';
import 'package:desktopapp/model.dart/partner_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model.dart/B2G_model.dart';
import 'model.dart/command_model.dart';
import 'model.dart/defaultvalue_model.dart';
import 'model.dart/request_model.dart';
import 'model.dart/segmentation_model.dart';
import 'model.dart/users_model.dart';

class Dash_controller extends GetxController {
  RxBool isDialogOpen = false.obs;
  RxBool isLoading_dash = true.obs;
  RxBool isLoading_request = true.obs;
  var pass_old = "";
  var pass_new = "";
  var pass_confirm = "";
  int status_edit_pass = 0;
  int status_request = 0;
  int status_accept = 0;
  int status_reject = 0;
  int status_defult = 0;
  int status_seg = 0;
  int status_comm = 0;
  int status_users = 0;
  int status_part = 0;
  int status_updefult = 0;
  int status_upsegment = 0;
  //----------
  int accept = 1;
  int reject = 0;
  List<RequestsModel> requests = [];
  List<DefaultModel> values = [];
  List<SegmentationModel> segment = [];
  List<CommandModel> command = [];
  List<UsersModel> users = [];
  List<PartnersModel> partners = [];
  List<B2GModel> convert = [];
  String baseurl = "http://192.168.43.212:8000/api/";
  String baseurl_img = "http://192.168.43.212:8000/";

  Future update_pass(String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse("${baseurl}admin/Edit_password"));
      request.fields.addAll({
        'oldPassword': pass_old,
        'newPassword': pass_new,
        'confirmation_password': pass_confirm,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_edit_pass = response.statusCode;
      var res = jsonDecode(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        print(jsonDecode(responseBody));

        print(jsonDecode(responseBody)['message']);
        print("okkkkk  change");
         EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        // toast(context, jsonDecode(responseBody)['message']);

      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //  toast(context, jsonDecode(responseBody)['message']);
        // print(token);
        print(res['message']);
        print(response.statusCode);
        print("noo change");
        print(response.request);
      }
    } catch (e) {
       EasyLoading.showError(e.toString());
      print("errrorrr");
      print(e);
    }
  }

  Future<List<RequestsModel>> GetRequests(String token) async {
    try {
      print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request =
          http.Request('GET', Uri.parse('${baseurl}requestPartners/pending'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_request = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get requests");
        print(response.statusCode);
        var res = requestsModelFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo get requests");
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future Accept(String token, int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse("${baseurl}admin/Modify_Request/${id}"));
      request.fields.addAll({'status': accept.toString()});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_accept = response.statusCode;
      var res = jsonDecode(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        requests = await GetRequests(ApiRequests.Token!);
        isLoading_request(!isLoading_request.value);
        print(response.statusCode);
        print(jsonDecode(responseBody));

        print(jsonDecode(responseBody)['message']);
        print("okkkkk  accept");
         EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        // toast(context, jsonDecode(responseBody)['message']);

      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //  toast(context, jsonDecode(responseBody)['message']);
        // print(token);
        print(res['message']);
        print(response.statusCode);
        print("noo acceept");
        print(response.request);
      }
    } catch (e) {
       EasyLoading.showError(e.toString());
      print("errrorrr");
      print(e);
    }
  }

  Future Reject(String token, int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse("${baseurl}admin/Modify_Request/${id}"));
      request.fields.addAll({'status': reject.toString()});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_reject = response.statusCode;
      var res = jsonDecode(responseBody);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode);
        print(jsonDecode(responseBody));
        requests = await GetRequests(ApiRequests.Token!);
        isLoading_request(!isLoading_request.value);
        print(jsonDecode(responseBody)['message']);
        print("okkkkk  reject");
         EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        // toast(context, jsonDecode(responseBody)['message']);

      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        //  toast(context, jsonDecode(responseBody)['message']);
        // print(token);
        print(res['message']);
        print(response.statusCode);
        print("noo reject");
        print(response.request);
      }
    } catch (e) {
        EasyLoading.showError(e.toString());
      print("errrorrr");
      print(e);
    }
  }

  Future<List<DefaultModel>> GetValues(String token) async {
    try {
      // print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request('GET', Uri.parse('${baseurl}default'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_defult = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get values");
        print(response.statusCode);
        var res = defaultModelFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo get values");
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<SegmentationModel>> GetSegmentation(String token) async {
    try {
      // print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request('GET', Uri.parse('${baseurl}segmentations'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_seg = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get segmenta");
        print(response.statusCode);
        var res = segmentationModelFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo get segmentat");
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<CommandModel>> Getcommand(String token) async {
    try {
      // print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request('GET', Uri.parse('${baseurl}admin/commands'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_comm = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get command");
        print(response.statusCode);
        var res = commandModelFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo get command");
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<UsersModel>> GetUsers(String token) async {
    try {
      // print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request('GET', Uri.parse('${baseurl}customers'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_users = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get users");
        print(response.statusCode);
        var res = usersModelFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo get users");
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<PartnersModel>> GetPartners(String token) async {
    try {
      // print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request('GET', Uri.parse('${baseurl}partners/admin'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_part = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get part");
        print(response.statusCode);
        var res = partnersModelFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo get part");
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<B2GModel>> Getconvert(String token) async {
    try {
      // print("tokennnnn is$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request('GET', Uri.parse('${baseurl}B2G'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      status_part = response.statusCode;
      if (response.statusCode == 200) {
        print("yesss get convert");
        print(response.statusCode);
        var res = b2GModelFromJson(responseBody);
        //
        return res;
      } else {
        print(response.statusCode);
        print("noo get convert");
        //EasyLoading.showError(jsonDecode(responseBody)['message']);
        //toast(context, jsonDecode(responseBody)['message']);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
   Future Logout(String token) async {
    try {
      //  print("token is :$token");
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('${baseurl}logout'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var res = jsonDecode(responseBody);

    //  statuscode_logout = response.statusCode;
      //json.decode(response.body);
      //jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final storage = FlutterSecureStorage();
        storage.delete(key: 'token');
        print(response);
       EasyLoading.showSuccess(jsonDecode(responseBody)['message']);
        print("yesss logout");
        print(response.statusCode);
        print(res);
        Get.offNamed('/wel');
        //  print(res[1].title);

      } else {
        EasyLoading.showError(jsonDecode(responseBody)['message']);
        print("nooo");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print("erroorr");
     EasyLoading.showError(e.toString());
    }
  }
}
