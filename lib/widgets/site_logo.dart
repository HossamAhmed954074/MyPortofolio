import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../generated/assets.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({this.onTap, super.key});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: ClipOval(
              child: Image.asset(
                Assets.imagesLogo,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Text(
            'Hossam Ahmed',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              //decoration: TextDecoration.underline,
              color: CustomColors.yellowSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
