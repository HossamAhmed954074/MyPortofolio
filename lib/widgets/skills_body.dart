import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/constant/text_styles.dart';
import 'package:hossam_pr/constant/size.dart';
import 'package:hossam_pr/widgets/skills_desctop.dart';
import 'package:hossam_pr/widgets/skills_phone.dart';
import 'package:hossam_pr/widgets/animated_widgets.dart';

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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [CustomColors.bgPrimary, CustomColors.bgSecondary],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(32, 80, 32, 80),
      child: Column(
        children: [
          // Section Header
          AnimatedFadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Column(
              children: [
                Text(
                  'Skills & Expertise',
                  style: AppTextStyles.h2.copyWith(fontSize: 42),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    'Crafting exceptional mobile experiences with cutting-edge technologies and modern development practices',
                    style: AppTextStyles.bodyLarge.copyWith(height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),

                // Decorative Line
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: CustomColors.primaryGradient,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 60),

          // Skills Content
          AnimatedFadeInUp(
            delay: const Duration(milliseconds: 400),
            child:
                constraints.maxWidth >= kMedDesktopWidth
                    ? const SkillsDesctop()
                    : const SkillsPhone(),
          ),
        ],
      ),
    );
  }
}
