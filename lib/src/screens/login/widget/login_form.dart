import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/theme.dart' as cus_theme;
import 'package:flutter_app/src/constants/setting.dart';
import 'package:flutter_app/src/models/user_model.dart';
import 'package:flutter_app/src/screens/home/home_screen.dart';
import 'package:flutter_app/src/services/auth_service.dart';
import 'package:flutter_app/src/utils/RegexValidator.dart';
import 'package:flutter_app/src/widgets/alert/AlertError.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/src/configs/route.dart' as router;
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  String? _errUsername;
  String? _errPassword;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _setError(String? usernameError, String? passwordError) {
    setState(() {
      _errUsername = usernameError;
      _errPassword = passwordError;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: const EdgeInsets.only(bottom: 22.0, left: 22.0, right: 22.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 28, top: 22, right: 28, bottom: 20),
        child: FromInput(
          usernameController: usernameController,
          passwordController: passwordController,
          errUsername: _errUsername,
          errPassword: _errPassword,
          setError: _setError,
        ),
      ),
    );
  }
}

class FromInput extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String? errUsername;
  final String? errPassword;
  final Function(String?, String?) setError; // ฟังก์ชันในการตั้งค่าข้อผิดพลาด

  const FromInput({
    super.key,
    required this.usernameController,
    required this.passwordController,
    this.errUsername,
    this.errPassword,
    required this.setError, // เพิ่มพารามิเตอร์นี้
  });

  @override
  State<FromInput> createState() => _FromInputState();
}

class _FromInputState extends State<FromInput> {
  final _color = Colors.black54;

  bool _showPassword = true;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    _showPassword = true;
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_buildForm(), _buildSubmitButton()],
    );
  }

  Card _buildForm() => Card(
        elevation: 0,
        child: Column(
          children: [
            _buildUsername(),
            if (widget.errUsername != null) ...[
              Text(widget.errUsername!,
                  style: const TextStyle(color: Colors.red)),
            ],
            const Divider(height: 22, thickness: 1, indent: 13, endIndent: 13),
            _buildPassword(),
            // แสดงข้อความข้อผิดพลาดหากมี
            if (widget.errPassword != null) ...[
              Text(widget.errPassword!,
                  style: const TextStyle(color: Colors.red)),
            ],
          ],
        ),
      );

  TextStyle _textStyle() =>
      TextStyle(fontWeight: FontWeight.w500, color: _color);

  TextField _buildUsername() => TextField(
        controller: widget.usernameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Username',
          hintText: 'hisampalas001',
          labelStyle: _textStyle(),
          icon: Icon(Icons.mail_outline, size: 22.0, color: _color),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        onSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
      );

  TextField _buildPassword() => TextField(
        focusNode: _passwordFocusNode,
        controller: widget.passwordController,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Password',
            labelStyle: _textStyle(),
            icon: Icon(Icons.lock, size: 22.0, color: _color),
            suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                icon: FaIcon(_showPassword
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash))),
        obscureText: _showPassword,
        keyboardType: TextInputType.text,
      );

  Container _buildSubmitButton() => Container(
        margin: const EdgeInsets.only(top: 210.0),
        width: double.infinity,
        height: 65,
        decoration: _boxDecoration(),
        child: TextButton(
          onPressed: _onSubmitLogin,
          child: const Text(
            'LOGIN',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w700),
          ),
        ),
      );

  BoxDecoration _boxDecoration() {
    const grandientStart = cus_theme.Themes.gradientStart;
    const grandientEnd = cus_theme.Themes.gradientEnd;
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      boxShadow: [
        BoxShadow(
            color: grandientStart, offset: Offset(1.0, 6.0), blurRadius: 20.0),
        BoxShadow(
            color: grandientEnd, offset: Offset(1.0, 6.0), blurRadius: 20.0),
      ],
      gradient: LinearGradient(
        colors: [grandientEnd, grandientStart],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
      ),
    );
  }

  Future _onSubmitLogin() async {
  String username = widget.usernameController.text;
  String password = widget.passwordController.text;

  // Clear the previous error messages
  widget.setError(null, null);

    //  if (!EmailSubmitRegexValidator().isValid(username)) {
    //   widget.setError("The email is invalid", null);
    //   return;
    // }

    // if (password.length < 8) {
    //   widget.setError(null, "Password must be at least 8 characters");
    //   return;
    // }

  try {
    final AuthService authService = AuthService();
    UserLoginModel user = UserLoginModel(username, password);
    final response = await authService.login(user);
    if (response != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(Setting.TOCKEN_PREF, response);

      Navigator.pushReplacementNamed(
        context,
        router.Route.home,
        arguments: {
          'title': 'Home',
        },
      );
    } else {
      const AlertError(message: "Invalid response").error(context);
    }
  } catch (e) {
    print('Login error: $e'); // แสดงข้อผิดพลาด
    const AlertError(message: "Username or Password is incorrect").error(context);
    setState(() {});
  }
}

}
