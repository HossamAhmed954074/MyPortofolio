import 'package:flutter/material.dart';
import 'package:hossam_pr/widgets/site_logo.dart';
import '../constant/colors.dart';
import '../constant/text_styles.dart';
import '../constant/nav_items.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({
    super.key,
    this.onLogoTap,
    this.onItemTap,
    required this.onNavItemTap,
  });
  final VoidCallback? onLogoTap;
  final VoidCallback? onItemTap;
  final Function(int) onNavItemTap;

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  int hoveredIndex = -1;
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isExtremelyNarrow = screenWidth < 500;

        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: isExtremelyNarrow ? 16 : 32,
          ),
          height: 80,
          decoration: BoxDecoration(
            color: CustomColors.bgPrimary.withAlpha((255 * 0.8).round()),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: CustomColors.bgLight2.withAlpha((255 * 0.3).round()),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((255 * 0.2).round()),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isExtremelyNarrow ? 12 : 24,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final availableWidth = constraints.maxWidth;
                final isNarrow =
                    availableWidth < 1000; // More aggressive threshold
                final isVeryNarrow = availableWidth < 700;
                final isExtremelyNarrow = availableWidth < 500;

                return Row(
                  children: [
                    // Logo Section
                    SiteLogo(onTap: widget.onLogoTap),

                    // Use Spacer for flexible space distribution
                    const Spacer(),

                    // Navigation Items - hide on narrow screens
                    if (!isNarrow) ...[
                      ...List.generate(navItem.length, (i) => _buildNavItem(i)),
                      SizedBox(width: isVeryNarrow ? 4 : 8),
                    ],

                    // CTA Button - always visible but shrinkable
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth:
                            isExtremelyNarrow
                                ? 60
                                : isVeryNarrow
                                ? 80
                                : 120,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: CustomColors.primaryGradient,
                          ),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.accentPrimary.withAlpha(
                                (255 * 0.3).round(),
                              ),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed:
                              () => widget.onNavItemTap(4), // Contact section
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  isExtremelyNarrow
                                      ? 6
                                      : isVeryNarrow
                                      ? 10
                                      : 14,
                              vertical: isExtremelyNarrow ? 6 : 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            isExtremelyNarrow
                                ? 'Hire'
                                : 'Hire Me', // Shorter text on very narrow screens
                            style: AppTextStyles.button.copyWith(
                              color: Colors.black,
                              fontSize:
                                  isExtremelyNarrow
                                      ? 10
                                      : isVeryNarrow
                                      ? 12
                                      : 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(int index) {
    final isHovered = hoveredIndex == index;
    final isActive = activeIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => hoveredIndex = index),
      onExit: (_) => setState(() => hoveredIndex = -1),
      child: GestureDetector(
        onTap: () {
          setState(() => activeIndex = index);
          widget.onNavItemTap(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
          ), // Further reduced from 4
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ), // Further reduced
          decoration: BoxDecoration(
            color:
                isActive
                    ? CustomColors.accentPrimary.withAlpha((255 * 0.1).round())
                    : isHovered
                    ? CustomColors.bgLight2.withAlpha((255 * 0.5).round())
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border:
                isActive
                    ? Border.all(
                      color: CustomColors.accentPrimary.withAlpha(
                        (255 * 0.3).round(),
                      ),
                      width: 1,
                    )
                    : null,
          ),
          child: Text(
            navItem[index],
            style: AppTextStyles.navigationItem.copyWith(
              color:
                  isActive
                      ? CustomColors.accentPrimary
                      : isHovered
                      ? CustomColors.textPrimary
                      : CustomColors.textSecondary,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              fontSize: 13, // Further reduced from 14 to save space
            ),
          ),
        ),
      ),
    );
  }
}
