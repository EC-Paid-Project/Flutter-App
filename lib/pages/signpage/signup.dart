import 'dart:convert';
import 'package:flutter/material.dart';
import '../../models/signup.dart';
import '../../urls/urls.dart';
import '../login/components/google_apple_button.dart';
import 'components/my_input_column.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupUser user = SignupUser();
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  _signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await signup(user);
        if (response.statusCode == 204) {
          Navigator.pushNamed(context, '/login');
        } else {
          if (jsonDecode((response.body))["non_field_errors"] != null) {
            Navigator.pushNamed(context, '/login');
          } else {
            setState(() {
              _errorMessage = "Fill Form Correctly";
            });
          }
        }
      } catch (err) {
        setState(() {
          _errorMessage = "Fill Form Correctly";
        });
      }
    } else {
      setState(() {
        _errorMessage = "Fill Form Correctly";
      });
    }
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[400],
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: isPortrait
                  ? BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    )
                  : BoxConstraints(),
              child: IntrinsicHeight(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Account Creation',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 95, 203, 230),
                                  Color.fromARGB(255, 213, 238, 238),
                                ]),
                            border: Border.all(
                                style: BorderStyle.solid,
                                width: 5,
                                color: Colors.white),
                          ),
                          child: Form(
                            key: _formKey,
                            child: MyInputColumn(user: user),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _signup,
                          style: ElevatedButton.styleFrom(
                            elevation: 9.9,
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          child: const Text('Signup'),
                        ),
                      ),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      GoogleAndAppleButton(),
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: const Text(
                                "Already signed up? login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
