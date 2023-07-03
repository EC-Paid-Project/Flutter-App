
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoButton(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: Text(
          text,
        ),
        onPressed: onPressed,
        color: Colors.black,
      );
    } else {
      return ElevatedButton(
        child: Text(
          text,
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
      );
    }
  }
}
