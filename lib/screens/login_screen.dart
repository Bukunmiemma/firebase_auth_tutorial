
import 'package:firebase_auth__tutorial/widgets/custom_button.dart';
import 'package:flutter/material.dart';

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
                    context, '/SignupEmailPasswordScreen');
              },
              text: 'Email/Password Sign Up ',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(
                    context, '/LoginEmailPasswordScreen');
              },
              text: 'Email/Password Login',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, '/PhoneScreen');
              },
              text: 'Phone Sign In',
            ),
            CustomButton(
              onTap: () {},
              text: 'Google Sign In',
            ),
            CustomButton(
              onTap: () {},
              text: 'Facebook Sign In',
            ),
            CustomButton(
              onTap: () {},
              text: 'Anonymous Sign In',
            ),
          ],
        ),
      ),
    );
  }
}
