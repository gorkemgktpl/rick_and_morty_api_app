import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/route_generator.dart';
import 'package:rick_and_morty/search_bar_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  Future<void> navigator(BuildContext context, String page, String text) async {
    await Navigator.of(context).pushNamed(page, arguments: text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty')),
      body: Column(
        children: [
          SearchBarForm(
            key: GlobalKey(),
            onSearch: (text) async {
              context.push(Routes.instance.characterPage(characterId: text));
            },
            titleText: 'Search Character',
            ),

          SearchBarForm(
            key: GlobalKey(),
            onSearch: (text) async {
              context.push(Routes.instance.episodePage(episodeId: text));
            }, 
            titleText: 'Search Episode'),
          /*
          SearchBarWidget(
            labelText: 'Search Character',
            onSearch: (text) async {
              context.push(Routes.instance.characterPage(characterId: text));
              // final page = CharacterPage(characterId: text);
              // await navigator(context, characterPage, text);
            },
          ),
          const SizedBox(height: 20),
          SearchBarWidget(
            labelText: 'Search Episode',
            onSearch: (text) async {
              context.push(Routes.instance.episodePage(episodeId: text));
              // final page = EpisodePage(episodeId: text);
              // await navigator(context, episodePage, text);
            },
          ), */
        ],
      ),
    );
  }
}
