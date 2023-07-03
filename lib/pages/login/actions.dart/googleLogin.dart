 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../../../urls/urls.dart';

signOut() {
    FirebaseAuth.instance.signOut();
  }

signInWithGoogle(BuildContext context) async {
  try {
    // print("dfddddddd");
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,      
      idToken: googleAuth?.idToken,
    );
// print(credential );
print(googleAuth?.idToken);
final a =await googlelogin(googleAuth?.idToken);
print(a);
if(a!=null){
  Navigator.of(context).pushNamed("/mainPage");
}

// print(userCredential);
// getAll();
print('-------------------');
  } catch (e) {

    // Handle sign-in error
    // print('Sign-in with Google failed: $e');
  }
}
