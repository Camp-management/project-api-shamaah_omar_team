import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthTextField extends StatelessWidget {
  AuthTextField({
    this.name,
    this.isEmail = false,
    this.isPassword = false,
    required this.controller,
    super.key,
  });

  final String? name;

  bool isEmail = false;

  bool isPassword = false;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: isEmail ? TextInputType.emailAddress : null,
      obscureText: isPassword ? true : false,
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        border: OutlineInputBorder(),
      ),
    );
  }
}
