import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/utils/project_utils.dart';
import 'package:hossam_pr/widgets/project_card_item.dart';
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
              // main
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop()
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (constraints.maxWidth >= kMinDesktopWidth)
                MainDesktop(screenSize: screenSize)
              else
                MainPhone(screenSize: screenSize),

              // Skills
              SkillsBody(screenWidth: screenWidth, constraints: constraints),

              // Projects
              Container(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: screenWidth,
                child: Column(
                  children: [
                    const Text(
                      'What Projects ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.whitePrimary,
                      ),
                    ),
                    SizedBox(height: 20),

                    // work project Card
                    Wrap(
                      spacing: 25,
                      runSpacing: 25,
                      children: [
                        for (
                          int i = 0;
                          i < ProjectUtils.myProjectUtils.length;
                          i++
                        )
                          ProjectCardItem(
                            projectUtils: ProjectUtils.myProjectUtils[i],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
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
