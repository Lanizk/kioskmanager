import 'package:flutter/material.dart';
import 'package:kiosk_app/theme/pallete.dart';
import 'package:kiosk_app/theme/theme_notifier.dart';

class AuthTextField extends StatelessWidget{

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
   
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor:Palette.cardLight,
            contentPadding: const EdgeInsets.all(AppSpacing.md),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Palette.border),
            )
          ),
        ),);
  }
}