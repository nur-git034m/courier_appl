import 'dart:convert';

import 'package:courier_appl/models/User.dart';
import 'package:courier_appl/presentation/screens/profile_screen/profie_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<void> LoginNumberAndPassword(
      String phoneNumber, String password, context) async {
    http.Response response = await http.post(Uri.parse(
        'https://7food.kz/api/auth/login?phone=$phoneNumber&password=$password'));

    if (response.statusCode == 200) {
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('token', json.decode(response.body)['token']);
      print(response.body);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ProfilePage()));
    } else {
      print(response.statusCode);
    }
  }

  Future<User> ProfileNameAndPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print(token);

    var headers = {
      'Content-Language': 'ru',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    };

    http.Response response = await http
        .get(Uri.parse('https://7food.kz/api/users/profile'), headers: headers);

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }
  }

  Future<void> ChangeNameAndPhone(String name, String phoneNumber) async {
    String phone = phoneNumber.substring(0, 10);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print(token);

    var headers = {
      'Content-Language': 'ru',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    };

    http.Response response = await http.put(
        Uri.parse(
            'https://7food.kz/api/users/profile/update?name=$name&phone=${phone}1'),
        headers: headers);

    if (response.statusCode == 200) {
      print('sadf');
    } else {
      print(response.statusCode);
      throw Exception(response.statusCode);
    }
  }
}
