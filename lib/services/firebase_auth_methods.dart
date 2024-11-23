import 'package:firebase_auth__tutorial/utils/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);
// EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
     //EMAIL LOGIN
    Future<void> loginWithEmail({
     required String email,
     required String password,
     required BuildContext context,

    })async {
     try{
       await _auth.signInWithEmailAndPassword(email: email, password: password,);
       if(!_auth.currentUser!.emailVerified){
        await sendEmailVerification(context);
       }

     } on FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
     }

    }

     //EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    
    try{
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email Verification Sent!');
    }on FirebaseAuthException catch(e){
    showSnackBar(context, e.message!);
    }
  }

}
