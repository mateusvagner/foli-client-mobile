import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foli_client_mobile/ui/customer/new_customer_screen.dart';
import 'package:foli_client_mobile/ui/home/home_screen.dart';
import 'package:foli_client_mobile/ui/quote/create_quote_screen.dart';
import 'package:foli_client_mobile/ui/supplier/new_supplier_screen.dart';
import 'package:foli_client_mobile/ui/user/create_account_screen.dart';
import 'package:foli_client_mobile/ui/user/login_screen.dart';

import 'initial_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
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
      initialRoute: '/homeScreen', // TODO
      routes: AppRotes.rotes,
      // home: const InitialScreen(title: 'FoliApp'),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class AppRotes {

  static Map<String, WidgetBuilder> rotes = {
    '/': (context) => const InitialScreen(title: 'FoliApp'),
    '/login': (context) => const LoginScreen(),
    '/createAccount': (context) => const CreateAccountScreen(),
    '/homeScreen': (context) => HomeScreen(),
    '/newSupplierScreen': (context) => const NewSupplierScreen(),
    '/newCustomerScreen': (context) => const NewCustomerScreen(),
    '/createQuoteScreen': (context) => const CreateQuoteScreen(),
  };
}
