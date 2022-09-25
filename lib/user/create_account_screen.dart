import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foli_client_mobile/resource/new_user_resource.dart';
import 'package:foli_client_mobile/service/dio_impl/dio_user_service.dart';
import 'package:foli_client_mobile/service/user_service.dart';
import 'package:foli_client_mobile/service/user_service_url.dart';

import '../utils/text_form_field_validator.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();

  final UserService _userService =
      DioUserService(userServiceURL: UserServiceURL());

  Future<void> createUser(
    String name,
    String email,
    String password,
    BuildContext context,
    Function(bool) callback,
  ) async {
    NewUserResource newUserResource = NewUserResource(
      name: name,
      email: email,
      password: password,
    );

    var createdUser = await _userService.postNewUser(newUserResource);

    if (kDebugMode) {
      print(createdUser?.name);
      print(createdUser?.email);
      print(createdUser?.password);
    }

    callback.call(createdUser != null);
  }
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _email = "";
  String _password = "";

  bool _isPasswordHidden = true;

  void setName(String name) {
    setState(() {
      _name = name;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crie sua conta"),
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
                validator: TextFormFieldValidator.nameValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: setName,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              const SizedBox(
                height: 24.0,
              ),
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
                  child: const Text("Criar conta"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      CreateAccountScreen().createUser(
                          _name, _email, _password, context, (success) {
                        if (!mounted) return;

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Usuário salvo com sucesso!')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Algo deu errado!')),
                          );
                        }
                      });
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
