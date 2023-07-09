import 'package:flutter/material.dart';
import '../../../models/signup.dart';
import 'custom_textfield.dart';

class MyInputColumn extends StatefulWidget {
  final SignupUser user;
  const MyInputColumn({super.key, required this.user});
  @override
  State<MyInputColumn> createState() => _MyInputColumnState();
}

class _MyInputColumnState extends State<MyInputColumn> {
  bool _isPasswordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          CustomTextField(
            user: widget.user,
            type: 'username',
            label: 'First Name',
            placeholder: 'Enter your First Name',
            myIcon: Icon(Icons.person),
          ),
          CustomTextField(
            user: widget.user,
            type: 'last_name',
            label: 'Last Name',
            placeholder: 'Enter your Last Name',
            myIcon: Icon(Icons.person),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            user: widget.user,
            type: 'email',
            label: 'Email',
            placeholder: 'Enter your email',
            myIcon: Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            user: widget.user,
            type: 'password',
            label: 'Password',
            placeholder: 'Enter your password',
            obscureText: !_isPasswordVisible,
            myIcon: Icon(Icons.password),
            suffixIcon: GestureDetector(
              onTap: _togglePasswordVisibility,
              child: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            user: widget.user,
            type: 'confirmPassword',
            label: 'Confirm Password',
            myIcon: Icon(Icons.password),
            placeholder: 'Confirm your password',
            suffixIcon: GestureDetector(
              onTap: _togglePasswordVisibility,
              child: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            obscureText: !_isPasswordVisible,
          ),
        ],
      ),
    );
  }
}
