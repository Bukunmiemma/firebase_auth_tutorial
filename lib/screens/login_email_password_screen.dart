import 'package:firebase_auth__tutorial/services/firebase_auth_methods.dart';
import 'package:firebase_auth__tutorial/widgets/custom_button.dart';
import 'package:firebase_auth__tutorial/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginEmailPasswordScreen extends StatefulWidget {
  static String routeName ='/LoginEmailPasswordScreen';
  
  const LoginEmailPasswordScreen({super.key});

  @override
  State<LoginEmailPasswordScreen> createState() =>
      _LoginEmailPasswordScreenState();
}

class _LoginEmailPasswordScreenState extends State<LoginEmailPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
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
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              obscureText: true,
              controller: passwordController,
              hintText: 'Enter your password',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(onTap: loginUser, text: 'Login'),
        ],
      ),
    );
  }
}
