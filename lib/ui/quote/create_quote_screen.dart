import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foli_client_mobile/design_system/design_system.dart';
import 'package:foli_client_mobile/web/resource/customer_resource.dart';
import 'package:foli_client_mobile/web/resource/supplier_resource.dart';

import '../../domain/quote/quote_item.dart';
import '../../utils/text_form_field_validator.dart';
import '../../web/service/customer_service.dart';
import '../../web/service/dio_impl/dio_customer_service.dart';
import '../../web/service/dio_impl/dio_factory.dart';
import '../../web/service/dio_impl/dio_supplier_service.dart';
import '../../web/service/supplier_service.dart';

class CreateQuoteScreen extends StatefulWidget {
  const CreateQuoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateQuoteScreen> createState() => _CreateQuoteScreenState();
}

class _CreateQuoteScreenState extends State<CreateQuoteScreen> {
  final _formKey = GlobalKey<FormState>();

  final CustomerService _customerService = DioCustomerService(
      DioFactory.addRefreshTokenInterceptors(
          DioFactory.createDioForRegister()));

  final SupplierService _supplierService = DioSupplierService(
      DioFactory.addRefreshTokenInterceptors(
          DioFactory.createDioForRegister()));

  CustomerResource? _selectedCustomer;

  late Future<List<CustomerResource>> _allCustomers;
  late Future<List<SupplierResource>> _allSuppliers;

  final _itemWidgets = <Widget>[];

  String _projectName = "";
  final _quoteItems = <QuoteItem>[];

  Future<List<CustomerResource>> fetchCustomers() async {
    List<CustomerResource> customers = await _customerService.getAllCustomers();
    return customers;
  }

  Future<List<SupplierResource>> fetchSuppliers() async {
    final suppliers = await _supplierService.getAllSuppliers();
    return suppliers;
  }

  void setProjectName(String name) {
    setState(() {
      _projectName = name;
    });
  }

  void addItemWidget() {
    setState(() {
      var quote = QuoteItem.empty();
      _quoteItems.add(quote);
      _itemWidgets.add(itemWidget(quote));
    });
  }

  @override
  void initState() {
    super.initState();
    _allCustomers = fetchCustomers(); // TODO tratar quando da erro na request
    _allSuppliers = fetchSuppliers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Orçamento"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                validator: TextFormFieldValidator.requiredField,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: setProjectName,
                decoration: foliInputDecoration('Nome do Projeto'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              FutureBuilder<List<CustomerResource>>(
                future: _allCustomers,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButtonFormField<CustomerResource>(
                      isExpanded: true,
                      value: _selectedCustomer,
                      decoration: foliInputDecoration(snapshot.data!.isEmpty
                          ? 'Sem Clientes Cadastrados'
                          : 'Cliente'),
                      // TODO
                      items: snapshot.data!.map((customer) {
                        return DropdownMenuItem(
                          value: customer,
                          child: Text(customer.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCustomer = newValue;
                        });
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              _itemWidgets.isNotEmpty
                  ? const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ITEMS',
                        style: foliCaptionStyle,
                        textAlign: TextAlign.left,
                      ),
                    )
                  : Container(), // TODO adicionar botao de criar cliente .. pegar cliente recem cadastrado
              const SizedBox(
                height: 12.0,
              ),
              ..._itemWidgets,
              const SizedBox(
                height: 24.0,
              ),
              TextButton.icon(
                onPressed: addItemWidget,
                label: Text("Adicionar Item".toUpperCase(),
                    style:
                        foliSubheadingStyle.copyWith(color: Colors.blueAccent)),
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
              const SizedBox(
                height: 48.0,
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
                      print(_projectName);
                      for (QuoteItem quoteItem in _quoteItems) {
                        print(quoteItem.item);
                        print(quoteItem.quantity);
                      }
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

  Widget itemWidget(QuoteItem quoteItem) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              validator: TextFormFieldValidator.requiredField,
              onChanged: (value) {
                quoteItem.item = value;
              },
              decoration: foliInputDecoration('Item'),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextFormField(
              validator: TextFormFieldValidator.requiredField,
              onChanged: (value) {
                quoteItem.quantity = value;
              },
              decoration: foliInputDecoration('Quantidade'),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
