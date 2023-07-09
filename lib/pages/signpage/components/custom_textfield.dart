import 'package:flutter/material.dart';
import '../../../models/signup.dart';
import '../../../platformSettings/input.dart';
import '../actions/actions.dart';

class CustomTextField extends StatelessWidget {
  final String type;
  final SignupUser user;
  final String label;
  final String placeholder;
  final Icon myIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool? obscureText;

  const CustomTextField({
    super.key,
    required this.type,
    required this.label,
    required this.placeholder,
    required this.user,
    required this.myIcon,
    this.suffixIcon,
    this.obscureText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PlatformTextField(
          labelText: label,
          prefixIcon: myIcon,
          onChanged: (value) {
            final onChangedFunction = getOnChangedFunction(type, user);
            if (onChangedFunction != null) {
              onChangedFunction(value);
            }
          },
          suffixIcon: suffixIcon,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType),
    );
  }
}
