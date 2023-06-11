import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/mainPage/main_page.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/profile_icon_widget.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/profile_menu_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileData {
  String name;
  String email;
  String password;
  String phoneNo;
  String address;

  ProfileData(
      {required this.name,
      required this.email,
      required this.password,
      required this.phoneNo,
      required this.address});
}

class ProfilePage extends StatelessWidget {
  final ProfileData userProfile;

  const ProfilePage(this.userProfile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ProfileIconWidget(),
              const SizedBox(
                height: 10,
              ),
              Text(userProfile.name),
              const SizedBox(
                height: 5,
              ),
              Text(userProfile.email),
              const SizedBox(
                height: 5,
              ),
              Text(userProfile.phoneNo),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/updateProfilePage');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
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
                onTap: () {},
                trailingIcon: true,
                textColor: Colors.black,
              ),
              ProfileMenuWidget(
                name: 'Change Address',
                leadingIcon: LineAwesomeIcons.location_arrow,
                onTap: () {
                  Navigator.pushNamed(context, '/addressPage');
                },
                trailingIcon: true,
                textColor: Colors.black,
              ),
              ProfileMenuWidget(
                name: 'Terms of Service',
                leadingIcon: LineAwesomeIcons.info,
                onTap: () {
                  Navigator.pushNamed(context, '/tos');
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
                  onTap: () {},
                  trailingIcon: false,
                  textColor: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
