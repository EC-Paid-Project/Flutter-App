import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/profile_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePageForm extends StatelessWidget {
  // final ProfileData userProfile;
  const ProfilePageForm({
    // required this.userProfile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              // initialValue: userProfile.name,
              decoration: InputDecoration(
                  label: Text('Full Name'),
                  prefixIcon: Icon(LineAwesomeIcons.user),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  floatingLabelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black))),
            ),
            const SizedBox(height: 10),
            TextFormField(
              // initialValue: userProfile.email,
              decoration: InputDecoration(
                  label: Text('Email'),
                  prefixIcon: Icon(LineAwesomeIcons.envelope),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  floatingLabelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black))),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              // initialValue: userProfile.password,
              decoration: InputDecoration(
                  label: Text('Password'),
                  prefixIcon: Icon(LineAwesomeIcons.fingerprint),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  floatingLabelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black))),
            ),
            const SizedBox(height: 10),
            TextFormField(
              // initialValue: userProfile.phoneNo,
              decoration: InputDecoration(
                  label: Text('Phone Number'),
                  prefixIcon: Icon(LineAwesomeIcons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  floatingLabelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black))),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profilePage');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ));
  }
}
