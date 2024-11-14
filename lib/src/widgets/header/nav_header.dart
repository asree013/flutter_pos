import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/theme.dart' as cus_them;
import 'package:flutter_app/src/models/user_model.dart';

class NavHeader extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  
  const NavHeader({super.key, required this.name,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(name, style: const TextStyle(color: Colors.white)),
      backgroundColor: cus_them.Themes.gradientEnd,
      iconTheme: const IconThemeData(
        color: Colors.white, // กำหนดสีไอคอนใน AppBar เป็นสีขาว
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);  // กำหนดขนาดของ AppBar
}
