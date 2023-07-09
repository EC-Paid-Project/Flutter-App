import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../urls/urls.dart';

signOut() {
  FirebaseAuth.instance.signOut();
}

signInWithGoogle(BuildContext context) async {
  try {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final a = await googlelogin(googleAuth?.idToken);
    if (a != null) {
      Navigator.of(context).pushNamed("/mainPage");
    }
  } catch (e) {
    // Handle sign-in error
  }
}
