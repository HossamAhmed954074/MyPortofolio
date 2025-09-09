import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/widgets/certifactions_section.dart';
import 'package:hossam_pr/widgets/contact_section.dart';
import 'package:hossam_pr/widgets/header_desctop.dart';
import 'package:hossam_pr/widgets/header_mobile.dart';
import 'package:hossam_pr/widgets/main_desktop.dart';
import 'package:hossam_pr/widgets/main_phone.dart';
import 'package:hossam_pr/widgets/project_section.dart';
import 'package:hossam_pr/widgets/skills_body.dart';
import 'package:hossam_pr/widgets/enhanced_footer.dart';
import '../constant/size.dart';
import '../widgets/drawer_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(5, (index) => GlobalKey());
  int currentIndex = 0;
  bool showBackToTop = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Show/hide back to top button
    setState(() {
      showBackToTop = scrollController.offset > 300;
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex >= navBarKeys.length) return;

    final key = navBarKeys[navIndex];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
      setState(() {
        currentIndex = navIndex;
      });
    }
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
    setState(() {
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColors.scaffoldBg,
          endDrawer:
              constraints.maxWidth >= kMinDesktopWidth
                  ? null
                  : DrawerMobile(
                    onNavItemTap: (index) {
                      Navigator.of(context).pop();
                      scrollToSection(index);
                    },
                  ),
          body: Stack(
            children: [
              // Main Content
              SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    // Anchor for home section
                    Container(key: navBarKeys[0], height: 1),

                    // Header
                    if (constraints.maxWidth >= kMinDesktopWidth)
                      HeaderDesktop(onNavItemTap: scrollToSection)
                    else
                      HeaderMobile(
                        onLogoTap: _scrollToTop,
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),

                    // Hero Section
                    if (constraints.maxWidth >= kMinDesktopWidth)
                      MainDesktop(
                        screenSize: screenSize,
                        onNavItemTap: () => scrollToSection(4),
                      )
                    else
                      MainPhone(
                        screenSize: screenSize,
                        onNavItemTap: () => scrollToSection(4),
                      ),

                    // Skills Section
                    SkillsBody(
                      screenWidth: screenWidth,
                      constraints: constraints,
                      key: navBarKeys[1],
                    ),

                    // Projects Section
                    ProjectSectionBody(
                      screenWidth: screenWidth,
                      key: navBarKeys[2],
                    ),

                    // Certifications Section
                    CertificationsSectionBody(
                      screenWidth: screenWidth,
                      key: navBarKeys[3],
                    ),

                    // Contact Section
                    ContactSectionBody(key: navBarKeys[4]),

                    // Enhanced Footer
                    const EnhancedFooter(),
                  ],
                ),
              ),

              // Back to Top Button
              if (showBackToTop)
                Positioned(
                  bottom: 32,
                  right: 32,
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 200),
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: CustomColors.primaryGradient,
                            ),
                            borderRadius: BorderRadius.circular(28),
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
                          child: FloatingActionButton(
                            onPressed: _scrollToTop,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
