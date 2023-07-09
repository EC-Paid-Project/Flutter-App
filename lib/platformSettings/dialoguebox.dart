import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onCancelPressed;
  final VoidCallback onConfirmPressed;
  const PlatformAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onCancelPressed,
    required this.onConfirmPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: onCancelPressed,
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: onConfirmPressed,
            child: const Text('Confirm'),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: onCancelPressed,
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onConfirmPressed,
            child: const Text('Confirm'),
          ),
        ],
      );
    }
  }
}
