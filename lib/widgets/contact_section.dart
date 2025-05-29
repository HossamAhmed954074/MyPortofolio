
import 'dart:js_interop' as js;
import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/generated/assets.dart';

class ContactSectionBody extends StatelessWidget {
  const ContactSectionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      width: double.maxFinite,
      child: Column(
        children: [
          const Text(
            'Get in Touch ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                   js.globalContext.callMethod(
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'open' as js.JSAny,
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'https://github.com/HossamAhmed954074' as js.JSAny?,
                      );
                },
                child: Image.asset(
                  Assets.imagesGithub,
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(width: 20),
    
              InkWell(
                onTap: () {
                   js.globalContext.callMethod(
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'open' as js.JSAny,
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'https://www.linkedin.com/in/hossam-ahmed-ab4987248' as js.JSAny?,
                      );
                },
                child: Image.asset(
                  Assets.imagesLinkedin,
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  js.globalContext.callMethod(
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'open' as js.JSAny,
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'https://wa.me/qr/5DZ4OKTHQUCIC1' as js.JSAny?,
                      );
                },
                child: Image.asset(
                  Assets.imagesWhatSapp,
                  height: 40,
                  width: 40,
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                   js.globalContext.callMethod(
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'open' as js.JSAny,
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'https://www.facebook.com/hossam.ahmed.400159/?locale=ar_AR' as js.JSAny?,
                      );
                },
                child: Image.asset(
                  Assets.imagesFacebook,
                  height: 30,
                  width: 30,
                ),
              ),
               SizedBox(width: 20),
              InkWell(
                onTap: () {
                   js.globalContext.callMethod(
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'open' as js.JSAny,
                        // ignore: invalid_runtime_check_with_js_interop_types
                        'https://www.youtube.com/@50_Code' as js.JSAny?,
                      );
                },
                child: Image.asset(
                  Assets.imagesYouTube,
                  height: 30,
                  width: 30,
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
