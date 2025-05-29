import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavItemTap});
 final Function(int) onNavItemTap;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.scffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ),
          ),
          for (int i = 0; i < navIcon.length; i++)
            ListTile(
              onTap: () {
                onNavItemTap(i);
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              titleTextStyle: TextStyle(
                color: CustomColors.whitePrimary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              leading: Icon(navIcon[i]),
              title: Text(navItem[i]),
            ),
        ],
      ),
    );
  }
}
