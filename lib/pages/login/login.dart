import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/cart.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/user.dart';
import '../../stripe/stripe.dart';
import '../../urls/urls.dart';
import 'components/google_apple_button.dart';
import 'components/input_box.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginUser loginuser = LoginUser();
  String message = '';

  _login(BuildContext context) async {
   final response=await login(loginuser);
print(jsonDecode(response.body));

if(response.statusCode!=200)
     {

      setState(() {
        message ="Invalid Credentials";
      });
    } else {
      setState(() {
        message = 'Login successful';
      });
      Navigator.pushNamed(context, "/mainPage");
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Welcome!',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
    ),
    body: OrientationBuilder(
      builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/login-background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: isPortrait
                  ? BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    )
                  : BoxConstraints(),
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/logo2.jpg'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        height: 120,
                      ),
                      SizedBox(height: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 95, 203, 230),
                                Color.fromARGB(255, 213, 238, 238),
                              ],
                            ),
                            border: Border.all(
                              style: BorderStyle.solid,
                              width: 5,
                              color: Colors.white,
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              MyInputBox(loginuser: loginuser),
                            ],
                          ),
                        ),
                      ),
                       const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            _login(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            elevation: 9.9,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                      if (message.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            message,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(child: Text("Forget Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),onPressed: (){Navigator.pushNamed(context, "/forgetPass");},),
                       const SizedBox(height: 20),
                      GoogleAndAppleButton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/signup");
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                border: Border.all(width: 2, color: Colors.white),
                              ),
                              child: const Text(
                                "Not signed up yet? Signup",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
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