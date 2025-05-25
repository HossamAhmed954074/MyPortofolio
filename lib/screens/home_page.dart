import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/widgets/certifactions_section.dart';
import 'package:hossam_pr/widgets/project_section.dart';
import 'package:hossam_pr/widgets/skills_body.dart';
import '../constant/size.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_desctop.dart';
import '../widgets/header_mobile.dart';
import '../widgets/main_desktop.dart';
import '../widgets/main_phone.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
              constraints.maxWidth >= kMinDesktopWidth ? null : DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // Header
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop()
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
                // Main
              if (constraints.maxWidth >= kMinDesktopWidth)
                MainDesktop(screenSize: screenSize)
              else
                MainPhone(screenSize: screenSize),

              // Skills
              SkillsBody(screenWidth: screenWidth, constraints: constraints),

              // Projects
              ProjectSectionBody(screenWidth: screenWidth),

               // Certifactions
              CertifactionsSectionBody(screenWidth: screenWidth),


              // Contact
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
              // Footer
              Container(height: 500, width: double.maxFinite),
            ],
          ),
        );
      },
    );
  }
}
