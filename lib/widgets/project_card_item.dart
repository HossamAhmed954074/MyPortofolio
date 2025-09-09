import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:hossam_pr/constant/colors.dart';
import 'package:hossam_pr/constant/text_styles.dart';
import 'package:hossam_pr/constant/app_styles.dart';
import 'package:hossam_pr/generated/assets.dart';
import 'package:hossam_pr/utils/project_utils.dart';
import 'dart:js_interop' as js;

class ProjectCardItem extends StatefulWidget {
  const ProjectCardItem({super.key, required this.projectUtils});
  final ProjectUtils projectUtils;

  @override
  State<ProjectCardItem> createState() => _ProjectCardItemState();
}

class _ProjectCardItemState extends State<ProjectCardItem>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
        _animationController.forward();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 320,
              height: 380,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: AppDecorations.cardDecoration.copyWith(
                boxShadow:
                    isHovered
                        ? [
                          BoxShadow(
                            color: CustomColors.accentPrimary.withAlpha(
                              (255 * 0.2).round(),
                            ),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                          BoxShadow(
                            color: Colors.black.withAlpha((255 * 0.3).round()),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ]
                        : AppDecorations.cardDecoration.boxShadow,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    
                    js.globalContext.callMethod(
                      'open'.toJS,
                      [widget.projectUtils.gitHubLink.toJS].toJS,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project Image with Overlay
                      Stack(
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.projectUtils.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Gradient Overlay
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withAlpha((255 * 0.3).round()),
                                ],
                              ),
                            ),
                          ),
                          // Hover Play Button
                          if (isHovered)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(
                                    (255 * 0.5).round(),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.launch,
                                    color: CustomColors.accentPrimary,
                                    size: 32,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                      // Content Section
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                widget.projectUtils.title,
                                style: AppTextStyles.h6.copyWith(
                                  color: CustomColors.textPrimary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),

                              // Description
                              Expanded(
                                child: Text(
                                  widget.projectUtils.subtitle,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    height: 1.5,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Tags
                              Wrap(
                                spacing: 6,
                                runSpacing: 4,
                                children: _buildTags(),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Footer
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColors.bgLight1.withAlpha(
                            (255 * 0.5).round(),
                          ),
                          border: Border(
                            top: BorderSide(
                              color: CustomColors.bgLight2.withAlpha(
                                (255 * 0.3).round(),
                              ),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'View Project',
                              style: AppTextStyles.caption.copyWith(
                                color: CustomColors.accentSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: CustomColors.accentPrimary.withAlpha(
                                  (255 * 0.1).round(),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                Assets.imagesGithub,
                                height: 16,
                                width: 16,
                                color: CustomColors.accentPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildTags() {
    // Extract tags from project title/description
    List<String> tags = [];
    if (widget.projectUtils.title.toLowerCase().contains('chat')) {
      tags.addAll(['Firebase', 'Bloc', 'Chat']);
    } else if (widget.projectUtils.title.toLowerCase().contains('weather')) {
      tags.addAll(['API', 'Bloc', 'Weather']);
    } else if (widget.projectUtils.title.toLowerCase().contains('book')) {
      tags.addAll(['REST API', 'Dio', 'Books']);
    } else if (widget.projectUtils.title.toLowerCase().contains('todo')) {
      tags.addAll(['Hive', 'Local DB', 'Productivity']);
    } else {
      tags.addAll(['Flutter', 'Dart']);
    }

    return tags
        .take(3)
        .map(
          (tag) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: CustomColors.accentPrimary.withAlpha((255 * 0.1).round()),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: CustomColors.accentPrimary.withAlpha(
                  (255 * 0.3).round(),
                ),
                width: 1,
              ),
            ),
            child: Text(
              tag,
              style: AppTextStyles.caption.copyWith(
                color: CustomColors.accentPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
        .toList();
  }
}
