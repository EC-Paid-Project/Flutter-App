import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String name;
  final IconData leadingIcon;
  final VoidCallback onTap;
  final bool trailingIcon;
  final Color textColor;

  const ProfileMenuWidget({
    required this.name,
    required this.leadingIcon,
    required this.onTap,
    required this.trailingIcon,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.cyan.withOpacity(0.1)),
        child: Icon(
          leadingIcon,
          color: Colors.cyan,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: textColor),
      ),
      trailing: trailingIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: Icon(
                LineAwesomeIcons.angle_right,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
