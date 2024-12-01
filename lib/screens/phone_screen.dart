import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth__tutorial/services/firebase_auth_methods.dart';
import 'package:firebase_auth__tutorial/widgets/custom_button.dart';
import 'package:firebase_auth__tutorial/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = '/PhoneScreen';
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void phoneSignIn() {
    context
        .read<FirebaseAuthMethods>()
        .phoneSignIn(context, phoneController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              obscureText: false,
              controller: phoneController,
              hintText: 'Enter phone number',
            ),
            const SizedBox(
              height: 5,
            ),
            CustomButton(onTap: phoneSignIn, text: 'SEND OTP')
          ],
        ),
      ),
    );
  }
}
