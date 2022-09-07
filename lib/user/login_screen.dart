import 'package:flutter/material.dart';
import 'package:foli_client_mobile/utils/text_form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordHidden = true;

  String _email = "";
  String _password = "";

  void changePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                validator: TextFormFieldValidator.emailValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextFormField(
                validator: TextFormFieldValidator.passwordValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _isPasswordHidden,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Senha",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: changePasswordVisibility,
                  ),
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
                    if (_formKey.currentState!.validate()) {
                      // TODO
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
