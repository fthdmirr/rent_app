import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    Key? key,
    required this.labelText,
    required this.controller,
    this.validator, this.obscureText,
  }) : super(key: key);

  final String labelText;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: context.lowBorderRadius,
        ),
      ),
    );
  }
}
