
import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/utils/project_utils.dart';
import 'package:hossam_pr/widgets/project_card_item.dart';

class ProjectSectionBody extends StatelessWidget {
  const ProjectSectionBody({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      width: screenWidth,
      child: Column(
        children: [
          const Text(
            'Projects ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          SizedBox(height: 20),
    
          // work project Card
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 950,
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (
                  int i = 0;
                  i < ProjectUtils.myProjectUtils.length;
                  i++
                )
                  ProjectCardItem(
                    projectUtils: ProjectUtils.myProjectUtils[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
