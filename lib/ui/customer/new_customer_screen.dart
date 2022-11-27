import 'package:flutter/material.dart';
import 'package:foli_client_mobile/web/resource/customer_resource.dart';
import 'package:foli_client_mobile/web/service/customer_service.dart';
import 'package:foli_client_mobile/web/service/dio_impl/dio_customer_service.dart';
import 'package:foli_client_mobile/web/service/dio_impl/dio_factory.dart';

import '../../design_system/foli_sizes.dart';
import '../../design_system/foli_styles.dart';
import '../../utils/text_form_field_validator.dart';

class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({Key? key}) : super(key: key);

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final _formKey = GlobalKey<FormState>();

  final CustomerService _customerService = DioCustomerService(
      DioFactory.addRefreshTokenInterceptors(
          DioFactory.createDioForRegister()));

  final CustomerResource _customerResource = CustomerResource.empty();

  void setName(String name) {
    setState(() {
      _customerResource.setName(name);
    });
  }

  void setPhone(String phone) {
    setState(() {
      _customerResource.setPhone(phone);
    });
  }

  void setEmail(String email) {
    setState(() {
      _customerResource.setEmail(email);
    });
  }

  void setAddress(String address) {
    setState(() {
      _customerResource.setAddress(address);
    });
  }

  void saveNewCustomer(BuildContext context) {
    _customerService
        .postNewCustomer(_customerResource)
        .then((value) => {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cliente salvo com sucesso!'),
                ),
              ),
              Navigator.pushNamed(context, '/homeScreen'),
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
        title: const Text("Novo Cliente"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                    validator: TextFormFieldValidator.requiredField,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: setName,
                    decoration: foliInputDecoration('Nome do Cliente')),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: TextFormFieldValidator.requiredField,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: setPhone,
                    decoration: foliInputDecoration('Telefone')),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: TextFormFieldValidator.requiredField,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: setEmail,
                    decoration: foliInputDecoration('E-mail')),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                    validator: TextFormFieldValidator.requiredField,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: setAddress,
                    decoration: foliInputDecoration('Endereço')),
                const SizedBox(
                  height: 32.0,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      width: screenWidthPercentage(context, percentage: 60),
                      height: 48),
                  child: ElevatedButton(
                    child: const Text(
                      "Salvar",
                      style: foliSubheadingStyle,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveNewCustomer(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
