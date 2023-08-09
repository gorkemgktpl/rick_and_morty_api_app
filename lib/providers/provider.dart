import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/services/character_client.dart';
import '../services/episode_client.dart';
import 'notifier.dart';


final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));
});

final characterProvider = FutureProvider.autoDispose
    .family<Character, String>((ref, characterId) async {
  final client = CharacterClient(ref.watch(dioProvider));
  final Character character =
      await client.getCharacter(characterId: characterId);
  return character;
});

final episodeProvider =
    FutureProvider.autoDispose.family<Episode, String>((ref, episodeId) async {
  final client = EpisodeClient(ref.watch(dioProvider));
  final Episode episode = 
      await client.getEpisode(episodeId: episodeId);
  ref.watch(currentEpisodeProvider.notifier).changeEpisode(episode);
  return episode;
});


final getCharacterListProvider =
    FutureProvider.autoDispose<List<Character>>((ref) async {
  final currentEpisode = ref.watch(currentEpisodeProvider);
  List<String> charactersFromEpisode = [];
  List<Character> characterList = [];
  charactersFromEpisode = currentEpisode.characters!;

  final futureList = charactersFromEpisode.map((e) {
    e = e.split("/").last;
    return ref.watch(characterProvider(e).future).then((value) {
      characterList.add(value);
    });
  });

  
  await Future.wait(futureList);
  characterList.sort((a,b) => a.id!.compareTo(b.id!));
  
  for (var element in characterList) {
    ref.watch(listProvider.notifier).addtoList(element);
  }

  return characterList;
});




/*
final getCharacterListProvider = FutureProvider.autoDispose
    .family<List<Character>, String>((ref, episodeId) async {
  final list = await ref.watch(
      episodeProvider(episodeId).selectAsync((episode) => episode.characters));
  List<String> charactersFromEpisode = [];
  List<Character> characterList = [];
  charactersFromEpisode = list!;

  final futureList = charactersFromEpisode.map((e) {
    e = e.split("/").last;
    return ref.watch(characterProvider(e).future).then((value) {
      characterList.add(value);
    });
  });

  await Future.wait(futureList);

  for (var element in characterList) {
    ref.watch(listProvider.notifier).addtoList(element);
  }


  // for (int index = 0; index <= charactersFromEpisode.length; index++) {
  //   charactersFromEpisode[index] = charactersFromEpisode[index].split("/").last;
  //   final character =
  //       await ref.watch(characterProvider(charactersFromEpisode[index]).future);
  //   ref.watch(listProvider.notifier).addtoList(character);
  // }

   return characterList;
});
*/
