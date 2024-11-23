import 'package:firebase_auth__tutorial/firebase_options.dart';
import 'package:firebase_auth__tutorial/screens/login_email_password_screen.dart';
import 'package:firebase_auth__tutorial/screens/login_screen.dart';
import 'package:firebase_auth__tutorial/screens/phone_screen.dart';
import 'package:firebase_auth__tutorial/screens/signup_email_password_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter firebase auth tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontSize: 15, color: Colors.white
          )
        )
      ),
       home: const LoginScreen(), 
       routes: {
       '/SignupEmailPasswordScreen': (context) => const SignupEmailPasswordScreen(),
        '/LoginEmailPasswordScreen': (context) => const LoginEmailPasswordScreen(),
        '/PhoneScreen': (context) => const PhoneScreen(),
       },
    );
  }
}
