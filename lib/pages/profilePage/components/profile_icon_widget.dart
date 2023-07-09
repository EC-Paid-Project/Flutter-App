import 'package:flutter/material.dart';

class ProfileIconWidget extends StatelessWidget {
  const ProfileIconWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: const Image(image: AssetImage('images/profile.png')),
      ),
    );
  }
}
