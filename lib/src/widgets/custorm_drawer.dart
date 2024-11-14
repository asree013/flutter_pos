import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/theme.dart' as cus_them;
import 'package:flutter_app/src/constants/assets.dart';
import 'package:flutter_app/src/constants/setting.dart';
import 'package:flutter_app/src/models/menu_model.dart';
import 'package:flutter_app/src/models/user_model.dart';
import 'package:flutter_app/src/widgets/Loadding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/src/configs/route.dart' as router;

class CustormDrawer extends StatefulWidget {
  final UserModel userData;
  const CustormDrawer({super.key, required this.userData});

  @override
  State<CustormDrawer> createState() => _CustormDrawerState();
}

class _CustormDrawerState extends State<CustormDrawer> {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildProfile(widget.userData),
          ..._buildMailMenu(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: cus_them.Themes.gradientEnd,
            ),
            title: const Text("Logout", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
            onTap: () {
              showDialogLogout();
            },
          )
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _buildProfile(UserModel userData) => UserAccountsDrawerHeader(
        accountName: Text(widget.userData.first_name),
        accountEmail: Text(widget.userData.last_name),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(widget.userData.image),
        ),
      );

  showDialogLogout() => (showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Text('คุณต้องการออกจากระบบ'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Loadding();
                      SharedPreferences.getInstance().then((pref) {
                        pref.clear();
                        Navigator.of(context).pop();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          router.Route.login,
                          (route) => false,
                        );
                      });
                    },
                    child: const Text(
                      'ออกจากระบบ',
                      style: TextStyle(
                          color: cus_them.Themes.gradientEnd,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'ยกเลิก',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            )
          ],
        );
      }));

  List<ListTile> _buildMailMenu() => ViewMenuModel()
      .items
      .map((r) => ListTile(
            title: Text(
              r.title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: FaIcon(
              r.icondata,
              color: r.colorData,
            ),
            onTap: () => r.onTab(context),
          ))
      .toList();
}
