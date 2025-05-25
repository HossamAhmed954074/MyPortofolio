import 'dart:js_interop' as js;
import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/generated/assets.dart';
import 'package:hossam_pr/utils/certficat_utils.dart';

class CertficatCardItem extends StatelessWidget {
  const CertficatCardItem({super.key, required this.certficatUtils});
  final CertficatUtils certficatUtils;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20,),
      clipBehavior: Clip.antiAlias,
      height: 300,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.scffoldBg,
      ),
      child: InkWell(
        onTap: () {
          js.globalContext.callMethod(
            // ignore: invalid_runtime_check_with_js_interop_types
            'open' as js.JSAny,
            // ignore: invalid_runtime_check_with_js_interop_types
            [certficatUtils.certLink] as js.JSAny?,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // project image
            Image.asset(
              certficatUtils.image,
              height: 140,
              width: 290,
              fit: BoxFit.cover,
            ),
            // title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                certficatUtils.title,
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

                certficatUtils.supTitle,
                style: TextStyle(
                  color: CustomColors.whiteSecondary,
                  fontSize: 12,
                ),
              ),
            ),
            const Spacer(),
            // fotter
            Container(
              color: CustomColors.bgLight2,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Git It',
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
                        [certficatUtils.certLink] as js.JSAny?,
                      );
                    },
                    child: Image.asset(
                      Assets.imagesDrive,
                      height: 25,
                      width: 25,
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
