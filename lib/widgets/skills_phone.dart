
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/skill_item.dart';

class SkillsPhone extends StatelessWidget {
  const SkillsPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 380,
      ),
      child: Column(
        children: [
          // platforms
          Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 180,
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
          const SizedBox(height: 40),
          Wrap(
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
        ],
      ),
    );
  }
}
