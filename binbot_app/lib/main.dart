import 'package:flutter/material.dart';
import 'package:binbot_app/ui/login.dart';
import 'package:binbot_app/ui/sign_up.dart';
import 'package:binbot_app/main_navigation.dart';
import 'package:binbot_app/network/auth_method.dart';
import 'package:binbot_app/ui/profile_settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/login': (context) => const Login(),
        '/main': (context) => const Main(),
        '/signup': (context) => const SignUp(),
        '/profile_settings': (context) => const ProfileSettings(),
      },
    );
  }
}
