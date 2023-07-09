import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const AlertDialog(
              title: Text('AlertDialog Title'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('This is a demo alert dialog.'),
                    Text('Would you like to approve of this message?'),
                  ],
                ),
              ),
            );
          } else {
            return const AlertDialog(
              title: Text('AlertDialog Title'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('This is a not demo alert dialog.'),
                    Text('Would you like to approve of this message?'),
                  ],
                ),
              ),
            );
          }
        });
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
