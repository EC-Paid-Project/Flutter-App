import 'package:flutter/material.dart';
import '../actions.dart/googleLogin.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

initLogin() {
  _googleSignIn.onCurrentUserChanged
      .listen((GoogleSignInAccount account) async {
    if (account != null) {
      return account;
    } else {
      return null;
    }
  } as void Function(GoogleSignInAccount? event)?);
  _googleSignIn.signInSilently().whenComplete(() => print("done"));
}

class GoogleAndAppleButton extends StatelessWidget {
  const GoogleAndAppleButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: () async {
            signInWithGoogle(context);
          },
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.android),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            signOut();
          },
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.apple),
          ),
        ),
      ],
    );
  }
}
