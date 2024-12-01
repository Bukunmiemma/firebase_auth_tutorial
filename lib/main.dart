import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth__tutorial/firebase_options.dart';
import 'package:firebase_auth__tutorial/screens/home_screen.dart';
import 'package:firebase_auth__tutorial/screens/login_email_password_screen.dart';
import 'package:firebase_auth__tutorial/screens/login_screen.dart';
import 'package:firebase_auth__tutorial/screens/phone_screen.dart';
import 'package:firebase_auth__tutorial/screens/signup_email_password_screen.dart';
import 'package:firebase_auth__tutorial/services/firebase_auth_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if(kIsWeb){
  //   await FacebookAuth.webInitialize(
  //     appId: 538480188998802 ,
  //     cookie: true,
  //     xfbml: true,
  //     version: "v15.0"
  //   );
  // }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter firebase auth tutorial',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        home: const AuthWrapper(),
        routes: {
          SignupEmailPasswordScreen.routeName: (context) =>
              const SignupEmailPasswordScreen(),
          LoginEmailPasswordScreen.routeName: (context) =>
              const LoginEmailPasswordScreen(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
