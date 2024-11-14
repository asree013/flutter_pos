import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/setting.dart';
import 'package:flutter_app/src/models/user_model.dart';
import 'package:flutter_app/src/services/auth_service.dart';
import 'package:flutter_app/src/widgets/alert/AlertError.dart';
import 'package:flutter_app/src/widgets/custorm_drawer.dart';
import 'package:flutter_app/src/widgets/header/nav_header.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/src/configs/route.dart' as router;
import 'package:flutter_app/src/configs/theme.dart' as cus_them;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late Future<UserModel> _userFuture;

  Future<UserModel> findMe() async {
    final pref = await SharedPreferences.getInstance();
    String? token = pref.getString(Setting.TOCKEN_PREF); // ดึง token
    if (token == null) {
      const AlertError(message: "Token is Null").error(context);
      throw Exception('Token is null');
    } else {
      return await AuthService().validJwtAndFindMe(token, context);
    }
  }

  @override
  void initState() {
    super.initState();
    _userFuture = findMe();
  }

  @override
  void dispose() {
    super.dispose();
    findMe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavHeader(
        name: "Home",
      ),
      drawer: FutureBuilder<UserModel>(
        future: _userFuture,  // ใช้ FutureBuilder เพื่อรอการโหลดข้อมูล
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Drawer(child: Center(child: CircularProgressIndicator()));  // กำลังโหลด
          } else if (snapshot.hasError) {
            return const Drawer(child: Center(child: Text("Error loading user")));  // ถ้ามีข้อผิดพลาด
          } else if (!snapshot.hasData) {
            return const Drawer(child: Center(child: Text("No user data")));  // ถ้าไม่มีข้อมูล
          } else {
            final user = snapshot.data!;  // เมื่อโหลดข้อมูลเสร็จ ใช้ข้อมูลผู้ใช้
            return CustormDrawer(userData: user);  // ส่งข้อมูลไปยัง CustormDrawer
          }
        },
      ),
      body: Container(
        child: TextButton(
          onPressed: () {
            SharedPreferences.getInstance().then((pref) {
              pref.clear();
              Navigator.pushNamedAndRemoveUntil(
                  context, router.Route.login, (rote) => false);
            });
          },
          child: const Text("logout"),
        ),
      ),
    );
  }
}
