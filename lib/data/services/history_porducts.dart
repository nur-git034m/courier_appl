import 'package:courier_appl/models/history_productsList.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class History_Product_Service{

Future<HistoryProducts> getHistoryofProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print(token);

    var headers = {
      'Content-Language': 'ru',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    };

    http.Response response = await http
        .get(Uri.parse('https://7food.kz/api/users/histories/10099/details'), headers: headers);

    if (response.statusCode == 200) {
      return HistoryProducts.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }
  }

}