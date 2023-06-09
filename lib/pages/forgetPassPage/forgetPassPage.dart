import 'dart:ui';
import 'package:flutter/material.dart';
import '../../platformSettings/input.dart';
import '../../urls/urls.dart';

class ForgetPassPage extends StatelessWidget {
   String email = "";

  ForgetPassPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
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
            color: const Color.fromARGB(255, 192, 177, 177).withOpacity(0.5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlatformTextField(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final a = await resetPassword(email);
                      if (a != null) {
                        Navigator.pushNamed(context, "/otpPage", arguments: a);
                      }
                    },
                    child: const Text('next'),
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
