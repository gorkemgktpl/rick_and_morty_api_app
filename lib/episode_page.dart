import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/character_list_widget.dart';
import 'package:rick_and_morty/episode_info_widget.dart';
import 'package:rick_and_morty/providers/provider.dart';


class EpisodePage extends ConsumerWidget {
  final String episodeId;
  const EpisodePage({super.key, required this.episodeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episode = ref.watch(episodeProvider(episodeId));

    return Expanded(
      child: episode.when(
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (data) {
            return Column(
              children: [
                EpisodeInfoWidget(episode: data),
                CharacterListWidget(episode: data),
              ],
            );
          },
        ),
    );
    
  }
}






/*
class EpisodePage extends ConsumerWidget {
  final String episodeId;
  const EpisodePage({super.key, required this.episodeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episode = ref.watch(episodeProvider(episodeId));

    return WillPopScope(
      onWillPop: () async{
        ref.read(listProvider.notifier).cleanList();
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                ref.read(listProvider.notifier).cleanList();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Episode Info'),
        ),
        body: episode.when(
          error: ((error, stackTrace) => Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (data) {
            return Column(
              children: [
                EpisodeInfoWidget(episode: data),
                CharacterListWidget(episode: data),
              ],
            );
          },
        ),
      ),
    );
  }
}
*/



