import 'package:hossam_pr/generated/assets.dart';

class CertficatUtils {
  final String image;
  final String title;
  final String supTitle;
  final String certLink;

  CertficatUtils({
    required this.image,
    required this.title,
    required this.supTitle,
    required this.certLink,
  });

 static List<CertficatUtils> myCertList = [
    CertficatUtils(
      image: Assets.certificationsUdemy,
      title: 'Complete Flutter And Dart Development',
      supTitle: 'Udemy',
      certLink: 'https://drive.google.com/file/d/1H7hzDG9gZl5MtGZOMUa3XP2xkmMTCDHM/view?usp=sharing',
    ),
    CertficatUtils(
      image: Assets.certificationsDepiMobile,
      title: 'Software Development - Mobile App Developer',
      supTitle: 'Ministry of Communications and Information Technology Of Egypt (DEPI)',
      certLink: 'https://drive.google.com/file/d/1s84zIW27HCEwGLSgijSgIuiWPUKSLvJn/view?usp=sharing',
    ),
     CertficatUtils(
      image: Assets.certificationsDepiEnglish,
      title: 'Business English',
      supTitle: 'Ministry of Communications and Information Technology Of Egypt (DEPI)',
      certLink: 'https://drive.google.com/file/d/1LF4QMG-QChgEwQ-jSvTMt7rJG_9dR-pE/view?usp=sharing',
    ),
     CertficatUtils(
      image: Assets.certificationsDepiTeamLeader,
      title: 'Team Leader in DEPI',
      supTitle: 'Ministry of Communications and Information Technology Of Egypt (DEPI)',
      certLink: 'https://drive.google.com/file/d/1Xhkrj5L_LclDetjngrvPL4CFfvypqnMY/view?usp=sharing',
    ),
      CertficatUtils(
      image: Assets.certificationsNtiMobile,
      title: 'Mobile App Development',
      supTitle: 'Ministry of Communications and Information Technology Of Egypt (NTI)',
      certLink: 'https://drive.google.com/file/d/1Xhkrj5L_LclDetjngrvPL4CFfvypqnMY/view?usp=sharing',
    ),
     CertficatUtils(
      image: Assets.certificationsZagFlutter,
      title: 'Flutter Application Development',
      supTitle: 'Zagazig University',
      certLink: 'https://drive.google.com/file/d/1tb1EGClhjuXJB4yOGQgFMLhjolSyEV2B/view?usp=sharing',
    ),
      CertficatUtils(
      image: Assets.certificationsRouteComputer,
      title: 'Programming Fundamentals',
      supTitle: 'Route Academy',
      certLink: 'https://drive.google.com/file/d/1yH1IZDN4qIUPYpEgZm2NMsR3_xHdh-6Q/view?usp=sharing',
    ),
  ];
}
