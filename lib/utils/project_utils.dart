import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hossam_pr/generated/assets.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String gitHubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.gitHubLink,
  });

  static List<ProjectUtils> myProjectUtils = [
    
    ProjectUtils(
      image: Assets.projectsPortfolioApp,
      title: 'My Portfolio App',
      subtitle:
          'Welcome to my personal portfolio! This project showcases my skills, experience, and the work I have done as a developer. You can explore my projects, resume, and contact information through this online portfolio.',
      gitHubLink: 'https://github.com/HossamAhmed954074/MyPortofolio',
    ),
    ProjectUtils(
      image: Assets.projectsEcommerceApp,
      title: 'Demo e-Commerce App',
      subtitle:
          'A modern, feature-rich e-commerce mobile application built with Flutter, showcasing best practices in mobile development, state management, and user experience design.',
      gitHubLink: 'https://github.com/HossamAhmed954074/Demo-e-Commerce',
    ),
    ProjectUtils(
      image: Assets.projectsAflam,
      title: 'Aflam App',
      subtitle:
          'Aflam is a sleek and intuitive movie discovery application built with Flutter. It leverages The Movie Database (TMDB) API to provide users with an extensive catalog of movies, trending content, and personalized favorites management. The app features a modern UI with smooth animations.',
      gitHubLink: 'https://github.com/HossamAhmed954074/Aflam',
    ),
    ProjectUtils(
      image: Assets.projectsQuizMinds,
      title: 'Quiz Minds App',
      subtitle:
          'Quiz Minds is a feature-rich Flutter quiz application that offers an engaging learning experience across multiple categories. Built with modern Flutter architecture and Firebase integration, it provides seamless user authentication, real-time leaderboards, and an intuitive quiz interface.',
      gitHubLink: 'https://github.com/HossamAhmed954074/QuizMinds',
    ),
    ProjectUtils(
      image: Assets.projectsRestaurantApp,
      title: 'Restaurant App',
      subtitle:
          'This is a feature-rich restaurant application built with Flutter that provides a seamless food ordering experience. The app includes user authentication, menu browsing, cart management, order tracking, and comprehensive user profile management.',
      gitHubLink: 'https://github.com/HossamAhmed954074/RestaurantApp',
    ),

    ProjectUtils(
      image: Assets.projectsChat,
      title: 'Chat App',
      subtitle:
          'This is a Chat App using fireBase Authintication And fireStore DataBase And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/chat_app',
    ),
    ProjectUtils(
      image: Assets.projectsLoopi,
      title: 'Loopi App',
      subtitle:
          'This is a Bus Booking App using fireBase Authintication And fireStore DataBase And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/loopi',
    ),
    ProjectUtils(
      image: Assets.projectsBooklyApp,
      title: 'Book Store App',
      subtitle:
          'This is a Book Store App using RestApi And Dio And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/book_store',
    ),
    ProjectUtils(
      image: Assets.projectsCharacterMoves,
      title: 'Character Movie App',
      subtitle:
          'This is a Character Movie App using RestApi And Dio And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/movies_app',
    ),
    ProjectUtils(
      image: Assets.projectsNews,
      title: 'News App',
      subtitle:
          'This is a News App using RestApi And Dio And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/news_app',
    ),
    ProjectUtils(
      image: Assets.projectsTodoApp,
      title: 'ToDo App',
      subtitle:
          'This is a ToDo App using Local DataBase by Hive And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/notes_app',
    ),
    ProjectUtils(
      image: Assets.projectsWeather,
      title: 'Weather App',
      subtitle:
          'This is a Wheather App using RestApi And Dio And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/weather_app',
    ),
  ];
}

// push this list to firestore

Future pushData() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  for (var project in listofDocuments) {
    await firestore.collection('projects').doc().set(project);
  }
}

var listofDocuments = [
  {
    "image": "",
    "title": "My Portfolio App",
    "subtitle":
        "Welcome to my personal portfolio! This project showcases my skills, experience, and the work I have done as a developer. You can explore my projects, resume, and contact information through this online portfolio.",
    "gitHubLink": "https://github.com/HossamAhmed954074/MyPortofolio",
  },
  {
    "image": "",
    "title": "Demo e-Commerce App",
    "subtitle":
        "A modern, feature-rich e-commerce mobile application built with Flutter, showcasing best practices in mobile development, state management, and user experience design.",
    "gitHubLink": "https://github.com/HossamAhmed954074/Demo-e-Commerce",
  },
  {
    "image": "",
    "title": "Aflam App",
    "subtitle":
        "Aflam is a sleek and intuitive movie discovery application built with Flutter. It leverages The Movie Database (TMDB) API to provide users with an extensive catalog of movies, trending content, and personalized favorites management. The app features a modern UI with smooth animations.",
    "gitHubLink": "https://github.com/HossamAhmed954074/Aflam",
  },
  {
    "image": "",
    "title": "Quiz Minds App",
    "subtitle":
        "Quiz Minds is a feature-rich Flutter quiz application that offers an engaging learning experience across multiple categories. Built with modern Flutter architecture and Firebase integration, it provides seamless user authentication, real-time leaderboards, and an intuitive quiz interface.",
    "gitHubLink": "https://github.com/HossamAhmed954074/Quiz-Minds",
  },
  {
    "image": "",
    "title": "Restaurant App",
    "subtitle":
        "This is a feature-rich restaurant application built with Flutter that provides a seamless food ordering experience. The app includes user authentication, menu browsing, cart management, order tracking, and comprehensive user profile management.",
    "gitHubLink": "https://github.com/HossamAhmed954074/restaurant_app",
  },
  {
    "image": "",
    "title": "Chat App",
    "subtitle":
        "This is a Chat App using fireBase Authintication And fireStore DataBase And using Bloc State MAnagment",
    "gitHubLink": "https://github.com/HossamAhmed954074/chat_app",
  },
  {
    "image": "",
    "title": "Loopi App",
    "subtitle":
        "This is a Bus Booking App using fireBase Authintication And fireStore DataBase And using Bloc State MAnagment",
    "gitHubLink": "https://github.com/HossamAhmed954074/loopi",
  },
  {
    "image": "",
    "title": "Book Store App",
    "subtitle":
        "This is a Book Store App using RestApi And Dio And using Bloc State MAnagment",
    "gitHubLink": "https://github.com/HossamAhmed954074/book_store",
  },
  {
    "image": "",
    "title": "Character Movie App",
    "subtitle":
        "This is a Character Movie App using RestApi And Dio And using Bloc State MAnagment",
    "gitHubLink": "https://github.com/HossamAhmed954074/movies_app",
  },
  {
    "image": "",
    "title": "News App",
    "subtitle":
        "This is a News App using RestApi And Dio And using Bloc State MAnagment",
    "gitHubLink": "https://github.com/HossamAhmed954074/news_app",
  },
  {
    "image": "",
    "title": "ToDo App",
    "subtitle":
        "This is a ToDo App using Local DataBase by Hive And using Bloc State MAnagment",
    "gitHubLink": "https://github.com/HossamAhmed954074/notes_app",
  },
  {
    "image": "",
    "title": "Weather App",
    "subtitle":
        "This is a Wheather App using RestApi And Dio And using Bloc State MAnagment",
    "gitHubLink": "https://github.com/HossamAhmed954074/weather_app",
  },
];
