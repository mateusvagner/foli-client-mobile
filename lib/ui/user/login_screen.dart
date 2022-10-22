import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foli_client_mobile/utils/text_form_field_validator.dart';

import '../../service/dio_factory.dart';
import '../../service/dio_impl/dio_user_service.dart';
import '../../service/interceptor/refresh_token_interceptor.dart';
import '../../service/user_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final UserService _userService = DioUserService(
      DioFactory.createDio()..interceptors.add(RefreshTokenInterceptor()));

  String _password = "";
  String _email = "";

  bool _isPasswordHidden = true;

  void setEmail(String email) {
    setState(() {
      _email = email;
    });
  }

  void setPassword(String password) {
    setState(() {
      _password = password;
    });
  }

  void changePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void logInUser(BuildContext context) {
    _userService
        .getAccessToken(_email, _password)
        .then((token) async => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Token $token gerado com sucesso!'),
                ),
              ),
            })
        .onError((error, stackTrace) => {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Algo deu errado!')),
              )
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
                onChanged: setEmail,
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextFormField(
                validator: TextFormFieldValidator.passwordValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _isPasswordHidden,
                onChanged: setPassword,
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
                      logInUser(context);
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
