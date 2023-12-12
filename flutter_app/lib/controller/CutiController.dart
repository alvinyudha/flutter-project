import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_project/Model/CutiModel.dart';
import 'package:login_project/api/servicesURL.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CutiController {
  static String url = baseUrl + '/cuti/show';

  static Future<List<CutiModel>> fetchCutiData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      List<dynamic> cutiDataList = responseData['data'];
      var cutiData =
          cutiDataList.map((json) => CutiModel.fromJson(json)).toList();

      return cutiData;
    } else {
      print('Gagal mengajukan cuti');
      return []; // Return an empty list in case of failure
    }
  }
}
