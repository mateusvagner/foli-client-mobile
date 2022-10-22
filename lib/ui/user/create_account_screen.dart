import 'package:flutter/material.dart';
import 'package:foli_client_mobile/resource/new_user_resource.dart';
import 'package:foli_client_mobile/service/dio_factory.dart';
import 'package:foli_client_mobile/service/dio_impl/dio_user_service.dart';
import 'package:foli_client_mobile/service/user_service.dart';
import 'package:foli_client_mobile/ui/user/login_screen.dart';

import '../../service/interceptor/refresh_token_interceptor.dart';
import '../../utils/text_form_field_validator.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  final UserService _userService = DioUserService(DioFactory.createDio());

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

  void saveNewUser(BuildContext context) {
    NewUserResource newUserResource = NewUserResource(
      name: _name,
      email: _email,
      password: _password,
    );

    _userService
        .postNewUser(newUserResource)
        .then((createdUser) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Usuário ${createdUser?.name}  foi salvo com sucesso!'),
                ),
              ),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())),
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
                      saveNewUser(context);
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
