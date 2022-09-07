import 'package:flutter/material.dart';
import 'package:foli_client_mobile/user/login_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
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
