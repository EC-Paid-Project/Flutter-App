import 'dart:ui';
import 'package:flutter/material.dart';
import '../../platformSettings/input.dart';
import '../../urls/urls.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  _OtpPage createState() => _OtpPage();
}

class _OtpPage extends State<OtpPage> {
  int otp = 1;
  String newPassword1 = "";
  String newPassword2 = "";
  String errorMessage = "";
  myFunction(jsonString) async {
    try {
      if (newPassword1.isNotEmpty && newPassword2.isNotEmpty) {
        if (newPassword1 == newPassword2) {
          if ((jsonString["otp"]) == (otp)) {
            final a = await sendOtp({
              "uid": jsonString["uid"],
              "token": jsonString["token"],
              "new_password1": newPassword1,
              "new_password2": newPassword2,
            }, jsonString["uid"], jsonString["token"]);
            if (a != null) {
              Navigator.pushNamed(context, "/login");
            }
          }
        } else {
          setState(() {
            errorMessage = "The passwords entered do not match.";
          });
        }
      } else {
        setState(() {
          errorMessage = "Please fill in all the required fields.";
        });
      }
    } catch (err) {
      // print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final jsonString = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Color.fromARGB(255, 192, 177, 177).withOpacity(0.5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlatformTextField(
                    labelText: 'OTP',
                    prefixIcon: Icon(Icons.security),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        otp = int.parse(value);
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  PlatformTextField(
                    labelText: 'New Password',
                    prefixIcon: Icon(Icons.lock),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        newPassword1 = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  PlatformTextField(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        newPassword2 = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => myFunction(jsonString),
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
