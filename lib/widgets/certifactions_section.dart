
import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/utils/certficat_utils.dart';
import 'package:hossam_pr/widgets/cert_card_item.dart';

class CertifactionsSectionBody extends StatelessWidget {
  const CertifactionsSectionBody({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColors.bgLight1,
      width: screenWidth,
      child: Column(
        children: [
          const Text(
            'Certificate ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          SizedBox(height: 20),
          // Certifactions Card
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 900
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (
                  int i = 0;
                  i < CertficatUtils.myCertList.length;
                  i++
                )
                  CertficatCardItem(
                    certficatUtils : CertficatUtils.myCertList[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
