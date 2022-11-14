import 'package:flutter/material.dart';
import 'package:foli_client_mobile/design_system/design_system.dart';
import 'menu_item_view_model.dart';

class MenuItemButton extends StatelessWidget {
  final MenuItemViewModel menuItemViewModel;

  const MenuItemButton({
    Key? key,
    required this.menuItemViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:  () => Navigator.pushNamed(context, menuItemViewModel.route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidthPercentage(context, percentage: 40),
            child: Icon(
              menuItemViewModel.icon,
              size: 48,
              color: Colors.white,
            ),
          ),
          verticalSpaceMedium,
          Text(
            menuItemViewModel.title,
            maxLines: 2,
            style: const TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
