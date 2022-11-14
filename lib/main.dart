import 'package:flutter/material.dart';
import 'package:foli_client_mobile/ui/home/home_screen.dart';
import 'package:foli_client_mobile/ui/user/create_account_screen.dart';
import 'package:foli_client_mobile/ui/user/login_screen.dart';

import 'initial_screen.dart';

void main() {
  runApp(const FoliApp());
}

class FoliApp extends StatelessWidget {
  const FoliApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foli App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/homeScreen',
      routes: {
        '/': (context) => const InitialScreen(title: 'FoliApp'),
        '/login': (context) => const LoginScreen(),
        '/createAccount': (context) => const CreateAccountScreen(),
        '/homeScreen': (context) => HomeScreen(),
      },
      // home: const InitialScreen(title: 'FoliApp'),
    );
  }
}
