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
  int index = 0;

  void scrollToSection(int navIndex) {
    if (navIndex == 5) {
      return;
    }
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(microseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColors.scffoldBg,
          endDrawer:
              constraints.maxWidth >= kMinDesktopWidth
                  ? null
                  : DrawerMobile(
                    onNavItemTap: (p0) {
                      scaffoldKey.currentState?.closeEndDrawer();
                      scrollToSection(p0);
                      setState(() {
                        index = p0;
                      });
                    },
                  ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navBarKeys.first),
                // Header
                if (constraints.maxWidth >= kMinDesktopWidth)
                  HeaderDesktop(
                    onNavItemTap: (p0) {
                      scrollToSection(p0);
                      setState(() {
                        index = p0;
                      });
                    },
                  )
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                // Main
                if (constraints.maxWidth >= kMinDesktopWidth)
                  MainDesktop(
                    screenSize: screenSize,
                    onNavItemTap: () {
                      scrollToSection(4);
                      setState(() {
                        index = 4;
                      });
                    },
                  )
                else
                  MainPhone(
                    screenSize: screenSize,
                    onNavItemTap: () {
                      scrollToSection(4);
                      setState(() {
                        index = 4;
                      });
                    },
                  ),

                // Skills
                SkillsBody(
                  screenWidth: screenWidth,
                  constraints: constraints,
                  key: navBarKeys[1],
                ),

                // Projects
                ProjectSectionBody(
                  screenWidth: screenWidth,
                  key: navBarKeys[2],
                ),

                // Certifactions
                CertifactionsSectionBody(
                  screenWidth: screenWidth,
                  key: navBarKeys[3],
                ),

                // Contact
                ContactSectionBody(key: navBarKeys[4]),
                // Footer
                Container(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                  width: double.maxFinite,
                  color: CustomColors.bgLight1,
                  child: Column(
                    children: [Text('Created By Hossam Ahmed Mahmoud ❤️')],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton:
              index > 0
                  ? FloatingActionButton(
                    backgroundColor: CustomColors.hintDark,
                    onPressed: () {
                      scrollToSection(0);
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Icon(
                      Icons.arrow_circle_up_outlined,
                      color: Colors.white,
                    ),
                  )
                  : null,
        );
      },
    );
  }
}
