import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformTextField extends StatelessWidget {
  final String labelText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final double? cupertinoHeight;

  const PlatformTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.cupertinoHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return SizedBox(
        height: 50,
        child: CupertinoTextField(
          placeholder: labelText,
          prefix: prefixIcon,
          suffix: suffixIcon,
          obscureText: obscureText,
          onChanged: onChanged,
          keyboardType: keyboardType,
          decoration: BoxDecoration(color: Colors.transparent),
          controller: controller,
        ),
      );
    } else {
      return TextField(
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: keyboardType,
        controller: controller,
      );
    }
  }
}
