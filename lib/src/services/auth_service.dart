import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/base_path.dart';
import 'package:flutter_app/src/constants/setting.dart';
import 'package:flutter_app/src/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/src/configs/route.dart' as router;

class AuthService {
  final Uri url = Uri.parse('${BasePath.BASE_URL}${BasePath.AUTH}');

  Future<String?> login(UserLoginModel data) async {
    final Uri loginUrl = Uri.parse('$url/login');
    try {
      final response = await http.post(
        loginUrl,
        body: {
          "email": data.email,
          "password": data.password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData["access_token"];
      } else {
        print('Login failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<UserModel> validJwtAndFindMe(String jwt, BuildContext context) async {
    final Uri urlFindMe = Uri.parse('$url/findme');
    final headers = {
      'Authorization': 'Bearer $jwt',
    };

    try {
      final response = await http.post(urlFindMe, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return UserModel.fromJson(data);
      } else {
        Navigator.pushNamed(context, router.Route.login);
        throw Exception(
            'Failed to validate JWT. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to validate JWT: $e');
    }
  }
}
