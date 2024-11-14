import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/scree.dart';

class Route {
  static const home = '/home';
  static const login = '/login';
  static const register = "/register";
  static const profile = '/profile';
  static const product= '/product';
  static const dashbord = '/dashbord';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (c) => HomeScreen(),
    login: (c) => LoginScreen(),
    profile: (c) => ProfileScreen(),
    product: (c) => ProductScreen(),
    dashbord: (c) => DashbordScreen(),
    register: (c) => RegisterSreen()
  };
}
