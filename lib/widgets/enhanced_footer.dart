import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/text_styles.dart';

class EnhancedFooter extends StatelessWidget {
  const EnhancedFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [CustomColors.bgSecondary, CustomColors.scaffoldBg],
        ),
      ),
      child: Column(
        children: [
          // Main Footer Content

          // Bottom Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: CustomColors.bgLight2.withAlpha((255 * 0.3).round()),
                  width: 1,
                ),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isNarrow = constraints.maxWidth < 600;

                if (isNarrow) {
                  // Stack vertically for narrow screens
                  return Column(
                    children: [
                      // Copyright
                      Text(
                        '© 2024 Hossam Ahmed Mahmoud. All rights reserved.',
                        style: AppTextStyles.caption.copyWith(
                          color: CustomColors.textMuted,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      // Made with love
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Made with ',
                            style: AppTextStyles.caption.copyWith(
                              color: CustomColors.textMuted,
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 14,
                          ),
                          Text(
                            ' using Flutter',
                            style: AppTextStyles.caption.copyWith(
                              color: CustomColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  // Side by side for wider screens
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Copyright
                      Flexible(
                        child: Text(
                          '© 2024 Hossam Ahmed Mahmoud. All rights reserved.',
                          style: AppTextStyles.caption.copyWith(
                            color: CustomColors.textMuted,
                          ),
                        ),
                      ),

                      // Made with love
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Made with ',
                            style: AppTextStyles.caption.copyWith(
                              color: CustomColors.textMuted,
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 14,
                          ),
                          Text(
                            ' using Flutter',
                            style: AppTextStyles.caption.copyWith(
                              color: CustomColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
