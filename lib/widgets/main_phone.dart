import 'dart:js_interop' as js;
import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/text_styles.dart';
import '../constant/app_styles.dart';
import '../generated/assets.dart';
import 'animated_widgets.dart';

class MainPhone extends StatelessWidget {
  const MainPhone({
    super.key,
    required this.screenSize,
    required this.onNavItemTap,
  });
  final Size screenSize;
  final Function() onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      constraints: BoxConstraints(minHeight: screenSize.height * 0.8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: CustomColors.backgroundGradient,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image with Enhanced Design
          AnimatedFadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    CustomColors.accentPrimary.withAlpha((255 * 0.3).round()),
                    CustomColors.accentSecondary.withAlpha((255 * 0.1).round()),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.accentPrimary.withAlpha(
                      (255 * 0.2).round(),
                    ),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipOval(
                  child: Image.asset(
                    Assets.imagesMe,
                    fit: BoxFit.cover,
                    width: 268,
                    height: 268,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Content Section
          Column(
            children: [
              // Greeting
              AnimatedFadeInUp(
                delay: const Duration(milliseconds: 400),
                child: Text(
                  'Hello, I\'m',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: CustomColors.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),

              // Name with Gradient
              AnimatedFadeInUp(
                delay: const Duration(milliseconds: 600),
                child: ShaderMask(
                  shaderCallback:
                      (bounds) => const LinearGradient(
                        colors: CustomColors.primaryGradient,
                      ).createShader(bounds),
                  child: Text(
                    'Hossam Ahmed',
                    style: AppTextStyles.h2.copyWith(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Title
              AnimatedFadeInUp(
                delay: const Duration(milliseconds: 800),
                child: Text(
                  'Flutter Developer',
                  style: AppTextStyles.h5.copyWith(
                    color: CustomColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),

              // Description
              AnimatedFadeInUp(
                delay: const Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Passionate mobile developer creating beautiful and efficient Flutter applications',
                    style: AppTextStyles.bodyMedium.copyWith(height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Action Buttons
              AnimatedFadeInUp(
                delay: const Duration(milliseconds: 1200),
                child: Column(
                  children: [
                    // Primary Button
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 280),
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
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: onNavItemTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
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
                    const SizedBox(height: 16),

                    // Secondary Button
                    SizedBox(
                      width: 200,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Download CV or View Projects
                          js.globalContext.callMethod(
                            'open'.toJS,
                            [
                                  'https://drive.google.com/file/d/1vCK61UqYXkBJoShbESRpH5k0ZO8SXygm/view?usp=sharing',
                                ]
                                as js.JSAny?,
                          );
                        },
                        style: AppButtonStyles.secondaryButton.copyWith(
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                        icon: const Icon(Icons.download, size: 20),
                        label: const Text('Download CV'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Stats Row
              AnimatedFadeInUp(
                delay: const Duration(milliseconds: 1400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem('12+', 'Projects'),
                    _buildStatItem('2+', 'Years'),
                    _buildStatItem('5+', 'Certificates'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback:
              (bounds) => const LinearGradient(
                colors: CustomColors.primaryGradient,
              ).createShader(bounds),
          child: Text(
            number,
            style: AppTextStyles.h5.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: CustomColors.textTertiary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
