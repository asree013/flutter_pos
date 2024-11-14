import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Row(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: 'hisampalas001',
                  icon:
                      Icon(Icons.mail_outline, size: 22.0, color: Colors.white),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: 'hisampalas001',
                  icon:
                      Icon(Icons.mail_outline, size: 22.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
