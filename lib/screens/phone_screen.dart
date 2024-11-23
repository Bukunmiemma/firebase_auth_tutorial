import 'package:firebase_auth__tutorial/widgets/custom_button.dart';
import 'package:firebase_auth__tutorial/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phonenumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phonenumberController.dispose();
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
              controller: phonenumberController,
              hintText: 'Enter phone number',
            ),
            const SizedBox(
              height: 5,
            ),
            CustomButton(onTap: () {}, text: 'SEND OTP')
          ],
        ),
      ),
    );
  }
}
