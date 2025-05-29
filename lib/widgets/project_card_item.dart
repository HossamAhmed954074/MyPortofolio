import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/generated/assets.dart';
import 'package:hossam_pr/utils/project_utils.dart';
import 'dart:js_interop' as js;

class ProjectCardItem extends StatelessWidget {
  const ProjectCardItem({super.key, required this.projectUtils});
  final ProjectUtils projectUtils;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20,),
      clipBehavior: Clip.antiAlias,
      height: 300,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.bgLight2,
      ),
      child: InkWell(
        onTap: () {
          js.globalContext.callMethod(
            // ignore: invalid_runtime_check_with_js_interop_types
            'open' as js.JSAny,
            // ignore: invalid_runtime_check_with_js_interop_types
            [projectUtils.gitHubLink] as js.JSAny?,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // project image
            Image.asset(
              projectUtils.image,
              height: 140,
              width: 260,
              fit: BoxFit.cover,
            ),
            // title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                projectUtils.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CustomColors.whitePrimary,
                ),
              ),
            ),
            // sub title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                projectUtils.supTitle,
                style: TextStyle(
                  color: CustomColors.whiteSecondary,
                  fontSize: 12,
                ),
              ),
            ),
            const Spacer(),
            // fotter
            Container(
              color: CustomColors.bgLight1,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Avalibale on',
                    style: TextStyle(
                      color: CustomColors.yellowSecondary,
                      fontSize: 10,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      js.globalContext.callMethod(
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'open' as js.JSAny,
                        // ignore: invalid_runtime_check_with_js_interop_types
                        [projectUtils.gitHubLink] as js.JSAny?,
                      );
                    },
                    child: Image.asset(
                      Assets.imagesGithub,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
