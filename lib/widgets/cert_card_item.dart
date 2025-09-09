import 'dart:js_interop' as js;
import 'dart:js_interop_unsafe';
import 'package:flutter/foundation.dart';
import 'package:hossam_pr/generated/assets.dart';
import 'package:hossam_pr/utils/cache_buster.dart';

import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/text_styles.dart';
import '../utils/certficat_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CertificateCardItem extends StatefulWidget {
  const CertificateCardItem({
    super.key,
    required this.certificateUtils,
    this.animationDelay = 0,
  });

  final CertificateUtils certificateUtils;
  final int animationDelay;

  @override
  State<CertificateCardItem> createState() => _CertificateCardItemState();
}

class _CertificateCardItemState extends State<CertificateCardItem>
    with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _elevationAnimation = Tween<double>(begin: 4.0, end: 12.0).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );

    // Start animation with delay
    Future.delayed(Duration(milliseconds: widget.animationDelay), () {
      if (mounted) _scaleController.forward();
    });
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });

    if (isHovered) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  void _openCertificate() {
    js.globalContext.callMethod(
      'open'.toJS,
      [widget.certificateUtils.certLink.toJS].toJS,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedBuilder(
          animation: _elevationAnimation,
          builder: (context, child) {
            return Container(
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.accentPrimary.withAlpha(
                      (_isHovered ? 255 * 0.3 : 255 * 0.1).round(),
                    ),
                    spreadRadius: _isHovered ? 2 : 0,
                    blurRadius: _elevationAnimation.value,
                    offset: Offset(0, _elevationAnimation.value / 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: CustomColors.cardGradient,
                    ),
                    border: Border.all(
                      color:
                          _isHovered
                              ? CustomColors.accentPrimary.withAlpha(
                                (255 * 0.5).round(),
                              )
                              : CustomColors.bgLight2.withAlpha(
                                (255 * 0.3).round(),
                              ),
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _openCertificate,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Certificate Image with Overlay
                          Expanded(
                            flex: 3,
                            child: Stack(
                              children: [
                                _CertificateImage(
                                  image: widget.certificateUtils.image,
                                ),
                                // Gradient Overlay
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        CustomColors.scaffoldBg.withAlpha(
                                          (255 * 0.7).round(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Certificate Icon
                                Positioned(
                                  top: 16,
                                  right: 16,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: CustomColors.accentPrimary
                                          .withAlpha((255 * 0.9).round()),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.verified,
                                      color: CustomColors.scaffoldBg,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Content Section
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  Text(
                                    widget.certificateUtils.title,
                                    style: AppTextStyles.h6.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: CustomColors.textPrimary,
                                      height: 1.3,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  const SizedBox(height: 8),

                                  // Subtitle/Issuer
                                  Expanded(
                                    child: Text(
                                      widget.certificateUtils.subtitle,
                                      style: AppTextStyles.caption.copyWith(
                                        color: CustomColors.textSecondary,
                                        height: 1.4,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // Action Footer
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // View Certificate Text
                                      Text(
                                        'View Certificate',
                                        style: AppTextStyles.caption.copyWith(
                                          color: CustomColors.accentPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      // Action Button
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: CustomColors.accentPrimary
                                              .withAlpha((255 * 0.1).round()),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.open_in_new,
                                          color: CustomColors.accentPrimary,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class _CertificateImage extends StatefulWidget {
  const _CertificateImage({required this.image});
  final String image;

  @override
  State<_CertificateImage> createState() => _CertificateImageState();
}

class _CertificateImageState extends State<_CertificateImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
// forces new cacheKey across retries

 

  

  @override
  void initState() {
    super.initState();
    
  }





  @override
  void dispose() {
    _fadeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Image.asset(Assets.certificationsDepiMobile);
  }
}

