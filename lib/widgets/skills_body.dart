
import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/constant/size.dart';
import 'package:hossam_pr/widgets/skills_desctop.dart';
import 'package:hossam_pr/widgets/skills_phone.dart';

class SkillsBody extends StatelessWidget {
  const SkillsBody({
    super.key,
    required this.screenWidth,
    required this.constraints,
  });

  final double screenWidth;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      color: CustomColors.bgLight1,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //tittle
          const Text(
            'What I Can Do ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          //platform
          if (constraints.maxWidth >= kMedDesktopWidth)
            SkillsDesctop()
          else
            SkillsPhone(),
        ],
      ),
    );
  }
}
