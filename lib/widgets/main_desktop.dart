
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/texts.dart';
import '../generated/assets.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: screenSize.height / 1.2,
      constraints: BoxConstraints(maxHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hText,
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.whitePrimary,
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Get in Touch'),
                ),
              ),
            ],
          ),
          ClipOval(
            child: Image.asset(
              Assets.imagesMe,
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
