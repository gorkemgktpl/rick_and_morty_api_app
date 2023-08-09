import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/character_list_item_widget.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/providers/notifier.dart';
import 'package:rick_and_morty/providers/provider.dart';
import 'model/character.dart';


class CharacterListWidget extends ConsumerWidget {
  final Episode episode;
  const CharacterListWidget({super.key, required this.episode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(getCharacterListProvider);
    List<Character> list = ref.watch(listProvider);

    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var character = list[index];
            return CharacterListItemWidget(character: character);
          }),
    );
  }
}

