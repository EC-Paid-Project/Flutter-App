import 'package:flutter/material.dart';
import '../../../models/user.dart';
import '../../../platformSettings/input.dart';

class MyInputBox extends StatefulWidget {
  final LoginUser loginuser;
  const MyInputBox({Key? key, required this.loginuser}) : super(key: key);
  @override
  _MyInputBoxState createState() => _MyInputBoxState();
}

class _MyInputBoxState extends State<MyInputBox> {
  bool _isPasswordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double spacing = screenHeight * 0.06;
    return Column(
      children: <Widget>[
        SizedBox(height: spacing),
        PlatformTextField(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email),
          onChanged: (value) {
            setState(() {
              widget.loginuser.email = value;
            });
          },
        ),
        SizedBox(height: spacing),
        PlatformTextField(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: GestureDetector(
            onTap: _togglePasswordVisibility,
            child: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          obscureText: !_isPasswordVisible,
          onChanged: (value) {
            setState(() {
              widget.loginuser.password = value;
            });
          },
        ),
        SizedBox(height: spacing),
      ],
    );
  }
}
