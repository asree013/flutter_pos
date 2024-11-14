import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/src/configs/route.dart' as router;

class MenuModel {
  final String title;
  final IconData icondata;
  final Color colorData;

  final Function(BuildContext context) onTab;

  const MenuModel(this.title, {
    required this.icondata, 
    required this.colorData, 
    required this.onTab
    }
  );
}

class ViewMenuModel {
  List<MenuModel> get items => <MenuModel>[
    MenuModel("Profile", icondata: FontAwesomeIcons.user, colorData: Colors.deepOrange, onTab: (context) {
      Navigator.of(context).pop();
      Navigator.pushNamed(context, router.Route.dashbord);
    } ),
    MenuModel("Dashbord", icondata: FontAwesomeIcons.chartPie, colorData: Colors.green, onTab:(context) {

    } ),
    MenuModel("Inbox", icondata: FontAwesomeIcons.inbox, colorData: Colors.amber, onTab:(context) {

    } ),
    MenuModel("Setting", icondata: FontAwesomeIcons.crop, colorData: Colors.deepOrange, onTab:(context) {

    } ),
  ];
}