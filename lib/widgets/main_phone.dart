import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/texts.dart';
import '../generated/assets.dart';

class MainPhone extends StatelessWidget {
  const MainPhone({super.key, required this.screenSize, required this.onNavItemTap});
  final Size screenSize;
  final Function() onNavItemTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      //height: screenSize.height / 1.2,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipOval(
            child: Image.asset(
              Assets.imagesMe,
              fit: BoxFit.cover,
              width: 250,
              height: 250,
            ),
          ),

          Row(
            children: [
              Column(
                children: [
                  Text(
                    hText,
                    style: TextStyle(
                      fontSize: 25,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.whitePrimary,
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: onNavItemTap,
                      child: Text('Get in Touch'),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
