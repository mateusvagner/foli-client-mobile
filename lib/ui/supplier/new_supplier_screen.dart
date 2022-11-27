import 'package:flutter/material.dart';
import 'package:foli_client_mobile/design_system/design_system.dart';
import '../../utils/text_form_field_validator.dart';
import '../../web/resource/supplier_resource.dart';
import '../../web/service/dio_impl/dio_factory.dart';
import '../../web/service/dio_impl/dio_supplier_service.dart';
import '../../web/service/supplier_service.dart';

class NewSupplierScreen extends StatefulWidget {
  const NewSupplierScreen({Key? key}) : super(key: key);

  @override
  State<NewSupplierScreen> createState() => _NewSupplierScreenState();
}

class _NewSupplierScreenState extends State<NewSupplierScreen> {
  final _formKey = GlobalKey<FormState>();

  final SupplierService _supplierService = DioSupplierService(
      DioFactory.addRefreshTokenInterceptors(
          DioFactory.createDioForRegister()));

  final SupplierResource _supplierResource = SupplierResource.empty();

  void setName(String name) {
    setState(() {
      _supplierResource.setName(name);
    });
  }

  void setPhone(String phone) {
    setState(() {
      _supplierResource.setPhone(phone);
    });
  }

  void setEmail(String email) {
    setState(() {
      _supplierResource.setEmail(email);
    });
  }

  void setAddress(String address) {
    setState(() {
      _supplierResource.setAddress(address);
    });
  }

  void setType(String type) {
    setState(() {
      _supplierResource.setType(type);
    });
  }

  void saveNewSupplier(BuildContext context) {
    _supplierService
        .postNewSupplier(_supplierResource)
        .then((value) => {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fornecedor salvo com sucesso!'),
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
        title: const Text("Novo Fornecedor"),
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
                    decoration: foliInputDecoration('Nome do Fornecedor')),
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
                  height: 24.0,
                ),
                TextFormField(
                    validator: TextFormFieldValidator.requiredField,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: setType,
                    decoration: foliInputDecoration('Tipo (Serviço/Produto)')),
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
                        saveNewSupplier(context);
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
