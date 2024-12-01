import 'package:firebase_auth__tutorial/screens/login_email_password_screen.dart';
import 'package:firebase_auth__tutorial/screens/phone_screen.dart';
import 'package:firebase_auth__tutorial/screens/signup_email_password_screen.dart';
import 'package:firebase_auth__tutorial/services/firebase_auth_methods.dart';
import 'package:firebase_auth__tutorial/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(
                    context, SignupEmailPasswordScreen.routeName);
              },
              text: 'Email/Password Sign Up ',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(
                    context, LoginEmailPasswordScreen.routeName);
              },
              text: 'Email/Password Login',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, PhoneScreen.routeName);
              },
              text: 'Phone Sign In',
            ),
            CustomButton(
              onTap: () {
                context.read<FirebaseAuthMethods>().signInWithGoogle(context);
              },
              text: 'Google Sign In',
            ),
            CustomButton(
              onTap: () {
                context.read<FirebaseAuthMethods>().signInWithFacebook(context);
              },
              text: 'Facebook Sign In',
            ),
            CustomButton(
              onTap: () {
                context.read<FirebaseAuthMethods>().signInAnonymously(context);
              },
              text: 'Anonymous Sign In',
            ),
          ],
        ),
      ),
    );
  }
}
