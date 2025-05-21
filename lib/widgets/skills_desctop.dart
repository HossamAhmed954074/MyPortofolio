

import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/skill_item.dart';

class SkillsDesctop extends StatelessWidget {
  const SkillsDesctop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // platforms
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColors.bgLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    leading: Image.asset(
                      platformItems[i]['img'],
                      width: 26,
                    ),
                    title: Text(platformItems[i]['title']),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 50),
        // skils
        Flexible(
          child: ConstrainedBox(
            constraints:const BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for(int i =0 ;i< skillItems.length;i++)
                  Chip(
                      backgroundColor: CustomColors.bgLight2,
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                      label: Text(skillItems[i]['title']), avatar: Image.asset(skillItems[i]['img'])),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
