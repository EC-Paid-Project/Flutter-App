import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/user.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/profile_icon_widget.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/profile_menu_widget.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/tos.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../urls/urls.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: FutureBuilder<User>(
        future: loadUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final User user = snapshot.data as User;
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const ProfileIconWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(user.username),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(user.email),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          // await bank();
                          Navigator.pushNamed(context, '/updateProfilePage');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Edit Profile'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileMenuWidget(
                      name: 'Billing Details',
                      leadingIcon: LineAwesomeIcons.wallet,
                      onTap: () {
                        Navigator.pushNamed(context, '/billingDetailsPage');
                      },
                      trailingIcon: true,
                      textColor: Colors.black,
                    ),
                    ProfileMenuWidget(
                      name: 'Order History',
                      leadingIcon: LineAwesomeIcons.history,
                      onTap: () {
                        Navigator.pushNamed(context, '/orderHistory');
                      },
                      trailingIcon: true,
                      textColor: Colors.black,
                    ),
                    ProfileMenuWidget(
                      name: 'Terms of Service',
                      leadingIcon: LineAwesomeIcons.info,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const TOSDialog();
                            });
                      },
                      trailingIcon: true,
                      textColor: Colors.black,
                    ),
                    ProfileMenuWidget(
                      name: 'Rate the App',
                      leadingIcon: LineAwesomeIcons.star,
                      onTap: () {},
                      trailingIcon: true,
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                      name: 'Logout',
                      leadingIcon: LineAwesomeIcons.alternate_sign_out,
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        final a=await logout();
                        if(a==200){
                        prefs.remove('lpguser');
                        prefs.remove('authToken');
                        Navigator.pushNamed(context, '/login');

                        }
                      },
                      trailingIcon: false,
                      textColor: Colors.red,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No user profile data found.'));
          }
        },
      ),
    );
  }
}

Future<User> loadUserProfile() async {
  final prefs = await SharedPreferences.getInstance();

  final userData = prefs.getString('lpguser');
  if (userData != null) {
    final userMap = jsonDecode(userData);
    final userMap1 = jsonDecode(userMap);
    User user = User(
        email: userMap1["email"],
        username: userMap1["first_name"] + " " + userMap1["last_name"]);
    return user;
  } else {
    throw Exception('User profile data not found in shared preferences.');
  }
}
