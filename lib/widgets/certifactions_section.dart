import 'package:flutter/material.dart';
import 'package:hossam_pr/utils/services.dart';
import '../constant/colors.dart';
import '../constant/text_styles.dart';
import '../utils/certficat_utils.dart';
import 'cert_card_item.dart';

class CertificationsSectionBody extends StatefulWidget {
  const CertificationsSectionBody({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  State<CertificationsSectionBody> createState() =>
      _CertificationsSectionBodyState();
}

class _CertificationsSectionBodyState extends State<CertificationsSectionBody>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Future<List<CertificateUtils>>
  _certsFuture; // Cache certificates future so it's called only once

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _animationController.forward();

    // Fetch certificates once
    _certsFuture = Services().getCertificates();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 80, 25, 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.scaffoldBg,
            CustomColors.bgSecondary,
            CustomColors.scaffoldBg,
          ],
        ),
      ),
      width: widget.screenWidth,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            children: [
              // Section Header
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [
                    // Section Title
                    ShaderMask(
                      shaderCallback:
                          (bounds) => LinearGradient(
                            colors: CustomColors.primaryGradient,
                          ).createShader(bounds),
                      child: Text(
                        'Professional Certifications',
                        style: AppTextStyles.h2.copyWith(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Section Subtitle
                    Text(
                      'Continuously expanding my expertise through industry-recognized certifications and professional development programs.',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: CustomColors.textSecondary,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),

                    // Decorative Line
                    Container(
                      width: 80,
                      height: 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: CustomColors.primaryGradient,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // Certifications Grid
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double cardWidth;

                    if (constraints.maxWidth >= 1200) {
                      cardWidth = 350;
                    } else if (constraints.maxWidth >= 800) {
                      cardWidth = 350;
                    } else {
                      cardWidth = constraints.maxWidth - 50;
                    }

                    return FutureBuilder<List<CertificateUtils>>(
                      future: _certsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        if (snapshot.hasError) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Text(
                              'Failed to load certifications',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: Colors.redAccent,
                              ),
                            ),
                          );
                        }
                        final certs = snapshot.data ?? [];
                        if (certs.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Text(
                              'No certifications available yet.',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: CustomColors.textSecondary,
                              ),
                            ),
                          );
                        }

                        return Wrap(
                          spacing: 30,
                          runSpacing: 30,
                          alignment: WrapAlignment.center,
                          children:
                              certs.asMap().entries.map((entry) {
                                final index = entry.key;
                                final cert = entry.value;
                                return AnimatedContainer(
                                  duration: Duration(
                                    milliseconds: 200 + (index * 100),
                                  ),
                                  child: SizedBox(
                                    width: cardWidth,
                                    child: CertificateCardItem(
                                      certificateUtils: cert,
                                      animationDelay: index * 150,
                                    ),
                                  ),
                                );
                              }).toList(),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 60),

              // Call to Action
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        CustomColors.primaryGradient
                            .map((c) => c.withAlpha((255 * 0.1).round()))
                            .toList(),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: CustomColors.accentTertiary.withAlpha(
                      (255 * 0.3).round(),
                    ),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.school_rounded,
                      size: 48,
                      color: CustomColors.accentTertiary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Committed to Continuous Learning',
                      style: AppTextStyles.h4.copyWith(
                        color: CustomColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Always staying updated with the latest technologies and best practices in software development.',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: CustomColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
