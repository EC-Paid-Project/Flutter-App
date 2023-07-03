import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../platformSettings/input.dart';
import '../../urls/urls.dart';

class ForgetPassPage extends StatelessWidget {
  String email="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Color.fromARGB(255, 192, 177, 177)
                .withOpacity(0.5), // Adjust the opacity as desired
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlatformTextField(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      //
                      //
                      print("--------------");
                      // final a="df";
                      final a=await resetPassword(email);

                      if(a!=null){
print(a);
                      Navigator.pushNamed(context, "/otpPage",arguments:a);
                      }
                      //await getOrderDetail(12.toString());
                      // await getUser();
                    },
                    child: Text('next'),
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
