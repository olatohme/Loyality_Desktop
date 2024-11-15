import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';



class ApiRequests {
  static String baseurl = "http://192.168.43.212:8000/api/";
  static String add_bundle = baseurl + "admin/Add_Bundle";
  static String del_bundle = baseurl + "admin/Delete_Bundle/";
  static String up_bundle = baseurl + "admin/update_Bundle/";
  static String login = baseurl + "loginByEmail";
  static String? Token = "";
  

  //static get token => null;

//userScore: new Text(totalScrore != null ? '$totalScrore ' : "0.00%"),

  static Future<http.Response> addBundle(
      String name,
      int price,
      int bonus,
      int gems,
      int goldenOffersNumber,
      int silverOffersNumber,
      int bronzeOffersNumber,
      int newOffersNumber,
      String token) async {
    Map<String, dynamic> data = {
      "name": name,
      "price": price,
      "bonus": bonus,
      "gems": gems,
      "golden_offers_number": goldenOffersNumber,
      "silver_offers_number": silverOffersNumber,
      "bronze_offers_number": bronzeOffersNumber,
      "new_offers_number": newOffersNumber,
    };

    /*    Future<String?> getToken() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    }
 */
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      //'Authorization': 'Bearer $data',
    };

    var body = jsonEncode({
      "name": name,
      "price": price,
      "bonus": bonus,
      "gems": gems,
      "golden_offers_number": goldenOffersNumber,
      "silver_offers_number": silverOffersNumber,
      "bronze_offers_number": bronzeOffersNumber,
      "new_offers_number": newOffersNumber,
    });

    http.Response res =
        await http.post(Uri.parse(add_bundle), headers: headers, body: body);

    return res;
  }
  /* static Future<http.Response> addBundle(
    String name,
    int price,
    int bonus,
    int gems,
    int goldenOffersNumber,
    int silverOffersNumber,
    int bronzeOffersNumber,
    int newOffersNumber,
  ) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 5|JNIXjcvPdBLE3Hi3FqFwRDqeY1d1JU8yvZMdpjgj'
      };
      var request = http.Request('Post', Uri.parse(add_bundle));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String responsBody = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = responsBody;
        print("adding bundle succeded");
        print(response.statusCode);
        print(res);
        //return res;
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        print(response.statusCode);
      }
    } catch (e) {
      print('error');
      print(e);
    }
  } */

  static Future<http.Response> edBundle(
    String name,
    int price,
    int bonus,
    int gems,
    int goldenOffersNumber,
    int silverOffersNumber,
    int bronzeOffersNumber,
    int newOffersNumber,
  ) async {
    Map<String, dynamic> data = {
      "name": name,
      "price": price,
      "bonus": bonus,
      "gems": gems,
      "golden_offers_number": goldenOffersNumber,
      "silver_offers_number": silverOffersNumber,
      "bronze_offers_number": bronzeOffersNumber,
      "new_offers_number": newOffersNumber,
    };
    http.Response res = await http.post(Uri.parse(up_bundle),
        headers: {
          "content-type": "application/json",
        },
        body: jsonEncode({
          "name": name,
          "price": price,
          "bonus": bonus,
          "gems": gems,
          "golden_offers_number": goldenOffersNumber,
          "silver_offers_number": silverOffersNumber,
          "bronze_offers_number": bronzeOffersNumber,
          "new_offers_number": newOffersNumber,
        }));
    return res;
  }

  static Future<http.Response> delBundle(String bundleName) async {
    http.Response res =
        await http.delete(Uri.parse(del_bundle + bundleName + "/"));
    return res;
  }

  static Future<http.Response> Login(String mail, String pass) async {
    // Map<String, dynamic>
    var data = {"email": mail, "password": pass};

    http.Response res = await http.post(Uri.parse(login),
        headers: {"Content-Type": "application/json"}, body: data);
    return res;
  }

/*   Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}  */

}
