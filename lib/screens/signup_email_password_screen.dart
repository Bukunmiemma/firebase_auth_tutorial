import 'package:firebase_auth__tutorial/services/firebase_auth_methods.dart';
import 'package:firebase_auth__tutorial/widgets/custom_button.dart';
import 'package:firebase_auth__tutorial/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupEmailPasswordScreen extends StatefulWidget {
  static String routeName = '/SignupEmailPasswordScreen';
  const SignupEmailPasswordScreen({super.key});

  @override
  State<SignupEmailPasswordScreen> createState() =>
      _SignupEmailPasswordScreenState();
}

class _SignupEmailPasswordScreenState extends State<SignupEmailPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: emailController,
              obscureText: false,
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Enter your password'),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(onTap: signUpUser, text: 'Sign Up'),
        ],
      ),
    ));
  }
}
