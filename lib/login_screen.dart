import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Bem-vindo!",
              style: TextStyle(
                fontSize: 32.0,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.6 / 2),
              child: Image.asset(
                'assets/images/sloth.jpg',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                child: const Text("Login"),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: OutlinedButton(
                child: const Text("Crie uma conta"),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
