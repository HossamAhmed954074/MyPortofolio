import 'package:hossam_pr/generated/assets.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String supTitle;
  final String gitHubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.supTitle,
    required this.gitHubLink,
  });

 static List<ProjectUtils> myProjectUtils = [
    ProjectUtils(
      image: Assets.projectsChat,
      title: 'Chat App',
      supTitle:
          'This is a Chat App using fireBase Authintication And fireStore DataBase And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/chat_app',
    ),
    ProjectUtils(
      image: Assets.projectsLoopi,
      title: 'Loopi App',
      supTitle:
          'This is a Bus Booking App using fireBase Authintication And fireStore DataBase And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/loopi',
    ),
    ProjectUtils(
      image: Assets.projectsBooklyApp,
      title: 'Book Store App',
      supTitle:
          'This is a Book Store App using RestApi And Dio And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/book_store',
    ),
    ProjectUtils(
      image: Assets.projectsCharacterMoves,
      title: 'Character Movie App',
      supTitle:
          'This is a Character Movie App using RestApi And Dio And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/movies_app',
    ),
    ProjectUtils(
      image: Assets.projectsNews,
      title: 'News App',
      supTitle:
          'This is a News App using RestApi And Dio And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/news_app',
    ),
    ProjectUtils(
      image: Assets.projectsTodoApp,
      title: 'ToDo App',
      supTitle:
          'This is a ToDo App using Local DataBase by Hive And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/notes_app',
    ),
    ProjectUtils(
      image: Assets.projectsWeather,
      title: 'Weather App',
      supTitle:
          'This is a Wheather App using RestApi And Dio And using Bloc State MAnagment',
      gitHubLink: 'https://github.com/HossamAhmed954074/weather_app',
    ),
  ];
}
