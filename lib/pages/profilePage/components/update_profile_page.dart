import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/profile_icon_widget.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/components/profile_page_form.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Column(children: [
              ProfileIconWidget(),
              SizedBox(height: 50),
              ProfilePageForm()
            ]),
          ),
        ));
  }
}
