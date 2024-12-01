import 'package:firebase_auth__tutorial/utils/show_otp_dialog.dart';
import 'package:firebase_auth__tutorial/utils/show_snack_bar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser!;
//State Persistence
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

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
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email Verification Sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Google Sign In
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        googleProvider.setCustomParameters(
          {'login_hint': 'user@example.com'},
        );
        await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
            final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          await _auth.signInWithCredential(credential);

        //   UserCredential userCredential =
        //       await _auth.signInWithCredential(credential);

        // if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        //   // create a new credential
        //   final credential = GoogleAuthProvider.credential(
        //     accessToken: googleAuth?.accessToken,
        //     idToken: googleAuth?.idToken,
        //   );

        //   UserCredential userCredential =
        //       await _auth.signInWithCredential(credential);

        //   // For google sign up, check if user credential is not null
        //   // if(userCredential.user != null){
        //   //   if(userCredential.additionalUserInfo!.isNewUser){}
        //   // }
        // }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // Facebook sign in
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      await _auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // PHONE SIGN IN
  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    TextEditingController codeController = TextEditingController();

    if (kIsWeb) {
      // works only on web
      ConfirmationResult result =
          await _auth.signInWithPhoneNumber(phoneNumber);

      // Display dialog box to display OTP

      showOTPDialog(
          context: context,
          codeController: codeController,
          onPressed: () async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: result.verificationId,
              smsCode: codeController.text.trim(),
            );
            await _auth.signInWithCredential(credential);
            Navigator.of(context).pop();
          });
    }

    // FOR ANDROID AND IOS
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // verification completed works only on android
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showSnackBar(context, e.message!);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          // codeSent is majorly helpful for ios, resendToken is for
          showOTPDialog(
              codeController: codeController,
              context: context,
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: codeController.text.trim(),
                );

                await _auth.signInWithCredential(credential);
                Navigator.of(context).pop();
              });
        }),
        codeAutoRetrievalTimeout: (String verificationId) {
          //Auto-resolution timed out...
        });
  }

  // Anonymous Sign in
  Future<void> signInAnonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Sign Out
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // Delete account
  Future<void> deleteAccount(BuildContext context) async {
    try {
      _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
