import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/character.dart';
import '../model/episode.dart';

final listProvider =
    StateNotifierProvider<ListNotifier, List<Character>>((ref) {
  return ListNotifier([]);
});


class ListNotifier extends StateNotifier<List<Character>> {
  ListNotifier(List<Character>? initialList) : super(initialList ?? []);

  void addtoList(Character character) {
    if (state.contains(character)) {
      state;
    } else {
      state = [...state, character];
    }
  }
  void cleanList() {
    state = [];
  }
}

final currentEpisodeProvider = StateNotifierProvider<EpisodeNotifier,Episode>((ref) => EpisodeNotifier(Episode()));

class EpisodeNotifier extends StateNotifier<Episode>{
  EpisodeNotifier(Episode? initialEp) : super(initialEp ?? Episode());

  void changeEpisode(Episode episode){
    state = episode;
  }

}

final pageIndexProvider = StateProvider<int>((ref) => 0);

final characterContentProvider = StateProvider<Widget>((ref) => Container());

final episodeContentProvider = StateProvider<Widget>((ref) => Container());
