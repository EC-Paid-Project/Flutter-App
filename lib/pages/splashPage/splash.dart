import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_ecommerce_app/urls/urls.dart";
import "package:shared_preferences/shared_preferences.dart";

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.getString("authToken");
      if (sharedPreferences.containsKey("authToken")) {
        final a = await getUser();
        if (a != null) {
          Navigator.pushNamed(context, "/mainPage");
        } else {
          Navigator.pushNamed(context, "/login");
        }
      } else {
        Navigator.pushNamed(context, "/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/ec-logo.png',
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
