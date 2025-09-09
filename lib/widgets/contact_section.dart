import 'dart:js_interop' as js;
import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/colors.dart';
import '../constant/text_styles.dart';
import '../generated/assets.dart';

class ContactSectionBody extends StatefulWidget {
  const ContactSectionBody({super.key});

  @override
  State<ContactSectionBody> createState() => _ContactSectionBodyState();
}

class _ContactSectionBodyState extends State<ContactSectionBody>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;

  // Contact information
  final String email = 'eltohamehossam@gmail.com';
  final String phone = '+20 1147032347';
  final String location = 'Cairo, Egypt';

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
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

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _animationController.forward();
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _openUrl(String url) {
    js.globalContext.callMethod('open'.toJS, [url.toJS].toJS);
  }

  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied to clipboard!'),
        backgroundColor: CustomColors.accentPrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 80, 25, 80),
      width: double.maxFinite,
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
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Section Header
                Column(
                  children: [
                    // Main Title
                    ShaderMask(
                      shaderCallback:
                          (bounds) => LinearGradient(
                            colors: CustomColors.primaryGradient,
                          ).createShader(bounds),
                      child: Text(
                        'Let\'s Connect',
                        style: AppTextStyles.h1.copyWith(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Subtitle
                    Container(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Text(
                        'Ready to turn ideas into reality? Let\'s discuss your next project and create something amazing together.',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: CustomColors.textSecondary,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
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

                const SizedBox(height: 60),

                // Contact Methods Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isWideScreen = constraints.maxWidth > 800;

                    if (isWideScreen) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Contact Information
                          Expanded(flex: 1, child: _buildContactInfo()),

                          const SizedBox(width: 60),

                          // Social Links
                          Expanded(flex: 1, child: _buildSocialLinks()),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _buildContactInfo(),
                          const SizedBox(height: 40),
                          _buildSocialLinks(),
                        ],
                      );
                    }
                  },
                ),

                const SizedBox(height: 60),

                // Call to Action
                ScaleTransition(
                  scale: _pulseAnimation,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: CustomColors.primaryGradient,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.accentPrimary.withAlpha(
                            (255 * 0.3).round(),
                          ),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () => _openUrl('mailto:$email'),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.email_rounded,
                              color: CustomColors.scaffoldBg,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Send Me an Email',
                              style: AppTextStyles.h6.copyWith(
                                color: CustomColors.scaffoldBg,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: CustomColors.cardGradient,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CustomColors.bgLight2.withAlpha((255 * 0.3).round()),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: AppTextStyles.h4.copyWith(
              color: CustomColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 24),

          // Email
          _buildContactItem(
            icon: Icons.email_rounded,
            title: 'Email',
            value: email,
            onTap: () => _openUrl('mailto:$email'),
            onCopy: () => _copyToClipboard(email, 'Email'),
          ),

          const SizedBox(height: 20),

          // Phone
          _buildContactItem(
            icon: Icons.phone_rounded,
            title: 'Phone',
            value: phone,
            onTap: () => _openUrl('tel:$phone'),
            onCopy: () => _copyToClipboard(phone, 'Phone number'),
          ),

          const SizedBox(height: 20),

          // Location
          _buildContactItem(
            icon: Icons.location_on_rounded,
            title: 'Location',
            value: location,
            onTap:
                () =>
                    _openUrl('https://www.google.com/maps/search/Cairo,+Egypt'),
            onCopy: () => _copyToClipboard(location, 'Location'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
    required VoidCallback onCopy,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColors.bgLight1.withAlpha((255 * 0.5).round()),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CustomColors.bgLight2.withAlpha((255 * 0.3).round()),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:
                    CustomColors.primaryGradient
                        .map((c) => c.withAlpha((255 * 0.2).round()))
                        .toList(),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: CustomColors.accentPrimary, size: 20),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.caption.copyWith(
                    color: CustomColors.textTertiary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: CustomColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onCopy,
                icon: const Icon(Icons.copy_rounded),
                color: CustomColors.textSecondary,
                iconSize: 18,
                tooltip: 'Copy',
              ),
              IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.open_in_new_rounded),
                color: CustomColors.accentPrimary,
                iconSize: 18,
                tooltip: 'Open',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinks() {
    final socialLinks = [
      {
        'asset': Assets.imagesGithub,
        'name': 'GitHub',
        'url': 'https://github.com/HossamAhmed954074',
        'description': 'Check out my projects and contributions',
      },
      {
        'asset': Assets.imagesLinkedin,
        'name': 'LinkedIn',
        'url': 'https://www.linkedin.com/in/hossam-ahmed-ab4987248',
        'description': 'Connect with me professionally',
      },
      {
        'asset': Assets.imagesWhatSapp,
        'name': 'WhatsApp',
        'url': 'https://wa.me/qr/5DZ4OKTHQUCIC1',
        'description': 'Send me a direct message',
      },
      {
        'asset': Assets.imagesFacebook,
        'name': 'Facebook',
        'url': 'https://www.facebook.com/hossam.ahmed.400159/?locale=ar_AR',
        'description': 'Follow my updates',
      },
      {
        'asset': Assets.imagesYouTube,
        'name': 'YouTube',
        'url': 'https://www.youtube.com/@50_Code',
        'description': 'Watch my coding tutorials',
      },
    ];

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: CustomColors.cardGradient,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CustomColors.bgLight2.withAlpha((255 * 0.3).round()),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Follow Me',
            style: AppTextStyles.h4.copyWith(
              color: CustomColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 24),

          ...socialLinks.map(
            (social) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildSocialItem(
                asset: social['asset'] as String,
                name: social['name'] as String,
                description: social['description'] as String,
                onTap: () => _openUrl(social['url'] as String),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialItem({
    required String asset,
    required String name,
    required String description,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CustomColors.bgLight1.withAlpha((255 * 0.5).round()),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: CustomColors.bgLight2.withAlpha((255 * 0.3).round()),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        CustomColors.primaryGradient
                            .map((c) => c.withAlpha((255 * 0.2).round()))
                            .toList(),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  asset,
                  width: 20,
                  height: 20,
                  color: CustomColors.accentPrimary,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: CustomColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTextStyles.caption.copyWith(
                        color: CustomColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.arrow_forward_ios_rounded,
                color: CustomColors.textTertiary,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
