
import 'package:flutter/material.dart';
import 'package:hossam_pr/widgets/site_logo.dart';

import '../constant/colors.dart';
import '../constant/nav_items.dart';
import '../styles/style.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, this.onLogoTap, this.onItemTap, required this.onNavItemTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onItemTap;
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 60,
      width: double.maxFinite,
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap),
          Spacer(),
          for (int i = 0; i < navItem.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                onPressed:(){
                  onItemTap;
                  onNavItemTap(i);
                } ,
                child: Text(
                  navItem[i],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.whitePrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


