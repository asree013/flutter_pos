import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/theme.dart' as cus_them;
import 'package:flutter_app/src/screens/register/widgets/form_register.dart';

class RegisterSreen extends StatefulWidget {
  const RegisterSreen({super.key});

  @override
  State<RegisterSreen> createState() => _MyRegisterSreentate();
}

class _MyRegisterSreentate extends State<RegisterSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("register")),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(gradient: cus_them.Themes.gradient),
            child: Row(
              children: [
                SingleChildScrollView(
                  child: FormRegister(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
