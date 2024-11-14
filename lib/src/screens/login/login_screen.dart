import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/theme.dart' as cus_them;
import 'package:flutter_app/src/screens/login/widget/login_form.dart';
import 'package:flutter_app/src/screens/login/widget/single_sing_on.dart';
import 'package:flutter_app/src/widgets/logo_app_widget.dart';
import 'package:flutter_app/src/configs/route.dart' as router;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: cus_them.Themes.gradient,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const LogoAppWidget(),
                const SizedBox(
                  height: 30,
                ),
                const LoginForm(),
                const SizedBox(
                  height: 30,
                ),
                _buildTxtBnt('forgot password'),
                const SingleSingOn(),
                const SizedBox(
                  height: 15,
                ),
                _buildTxtBnt('Dont have Account', onPressed: () {
                  Navigator.pushNamed(context, router.Route.register);
                }),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton _buildTxtBnt(
    String txt, {
    @required VoidCallback? onPressed, // Marked as nullable
    double fontSize = 16, // Use lowercase `double`
  }) =>
      TextButton(
        onPressed: onPressed,
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
}
