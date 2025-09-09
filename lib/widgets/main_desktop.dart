import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/text_styles.dart';
import '../constant/app_styles.dart';
import '../generated/assets.dart';
import 'animated_widgets.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
    required this.screenSize,
    required this.onNavItemTap,
  });
  final Size screenSize;
  final Function() onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: CustomColors.backgroundGradient,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            // Left Content
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting
                  AnimatedFadeInUp(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      'Hello, I\'m',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: CustomColors.textTertiary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Name with Gradient
                  AnimatedFadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: ShaderMask(
                      shaderCallback:
                          (bounds) => const LinearGradient(
                            colors: CustomColors.primaryGradient,
                          ).createShader(bounds),
                      child: Text(
                        'Hossam Ahmed',
                        style: AppTextStyles.h1.copyWith(
                          fontSize: 56,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Title
                  AnimatedFadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: Text(
                      'Flutter Developer',
                      style: AppTextStyles.h3.copyWith(
                        color: CustomColors.textSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Description
                  AnimatedFadeInUp(
                    delay: const Duration(milliseconds: 800),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Text(
                        'Passionate mobile developer crafting beautiful, efficient, and user-friendly applications with Flutter. Transforming ideas into reality through clean code and innovative solutions.',
                        style: AppTextStyles.bodyLarge.copyWith(height: 1.7),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Action Buttons
                  AnimatedFadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    child: Row(
                      children: [
                        // Primary CTA
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: CustomColors.primaryGradient,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.accentPrimary.withAlpha(
                                  (255 * 0.3).round(),
                                ),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: onNavItemTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(
                              Icons.message,
                              color: Colors.black,
                              size: 20,
                            ),
                            label: Text(
                              'Get in Touch',
                              style: AppTextStyles.button.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Secondary Button
                        OutlinedButton.icon(
                          onPressed: () {
                            // Download CV or View Projects
                          },
                          style: AppButtonStyles.secondaryButton,
                          icon: const Icon(Icons.download, size: 20),
                          label: const Text('Download CV'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Stats Row
                  AnimatedFadeInUp(
                    delay: const Duration(milliseconds: 1200),
                    child: Row(
                      children: [
                        _buildStatItem('12+', 'Projects'),
                        const SizedBox(width: 40),
                        _buildStatItem('2+', 'Years Experience'),
                        const SizedBox(width: 40),
                        _buildStatItem('5+', 'Certificates'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 60),

            // Right Content - Profile Image
            Expanded(
              flex: 2,
              child: AnimatedFadeInUp(
                delay: const Duration(milliseconds: 1400),
                child: Center(
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          CustomColors.accentPrimary.withAlpha(
                            (255 * 0.3).round(),
                          ),
                          CustomColors.accentSecondary.withAlpha(
                            (255 * 0.1).round(),
                          ),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.accentPrimary.withAlpha(
                            (255 * 0.2).round(),
                          ),
                          blurRadius: 40,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Image.asset(
                          Assets.imagesMe,
                          fit: BoxFit.cover,
                          width: 380,
                          height: 380,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback:
              (bounds) => const LinearGradient(
                colors: CustomColors.primaryGradient,
              ).createShader(bounds),
          child: Text(
            number,
            style: AppTextStyles.h4.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: CustomColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
