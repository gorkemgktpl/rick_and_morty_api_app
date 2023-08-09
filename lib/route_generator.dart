import 'package:flutter/material.dart';
import 'package:rick_and_morty/character_page.dart';
import 'package:rick_and_morty/episode_page.dart';
import 'package:go_router/go_router.dart';

import 'navigation/navigation_bar.dart';


class Routes {
  Routes._init();
  static Routes? _instance;
  static Routes get instance {
    return _instance ??= Routes._init();
  }

  String searchPage = '/searchPage';

  String episodePage({String? episodeId}) {
    if (episodeId == null) {
      return '/episodePage/:episodeId';
    } else {
      return '/episodePage/$episodeId';
    }
  }

  String characterPage({String? characterId}) {
    if (characterId == null) {
      return '/characterPage/:characterId';
    } else {
      return '/characterPage/$characterId';
    }
  }
}

final GoRouter router = GoRouter(
  initialLocation: Routes.instance.searchPage,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.instance.searchPage,
      builder: (BuildContext context, GoRouterState state) {
        return  const NavigationBarWidget();
      },
    ),
    GoRoute(
      path: Routes.instance.characterPage(),
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        var id = state.pathParameters["characterId"] as String;
        return CharacterPage(characterId: id);
      },
    ),
    GoRoute(
      path: Routes.instance.episodePage(),
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        var id = state.pathParameters["episodeId"] as String;
        return EpisodePage(episodeId: id);
      },
    ),
  ],
);


/*
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name) {
      case searchPage:
        return MaterialPageRoute(builder: (context) => const SearchPage());
      case Routes.instance.characterPage(characterId: null):
        var characterId = settings.arguments! as String;
        return MaterialPageRoute(
            builder: (context) => CharacterPage(characterId: characterId));
      case episodePage:
        var episodeId = settings.arguments! as String;
        return MaterialPageRoute(
            builder: (context) => EpisodePage(episodeId: episodeId));
      default:
        return MaterialPageRoute(builder: (context) => const SearchPage());
    }
  }
}
*/