import 'package:flutter/material.dart';
import 'package:foli_client_mobile/ui/home/menu_item_button.dart';
import 'package:foli_client_mobile/ui/home/menu_item_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<MenuItemViewModel> menuItems = [
    MenuItemViewModel(
      title: "Criar Orçamento",
      icon: Icons.note_alt_rounded,
      route: '/',
    ),
    MenuItemViewModel(
      title: "Cadastrar Cliente",
      icon: Icons.person_add_alt_1_rounded,
      route: '/newCustomerScreen',
    ),
    MenuItemViewModel(
      title: "Cadastrar Fornecedor",
      icon: Icons.factory_rounded,
      route: '/newSupplierScreen',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        color: Colors.white,
        child: GridView.builder(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final menuItem = menuItems[index];
            return MenuItemButton(menuItemViewModel: menuItem);
          },
        ),
      ),
    );
  }
}
