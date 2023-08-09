
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/episode_page.dart';
import 'package:rick_and_morty/providers/notifier.dart';
import 'package:rick_and_morty/search_bar_widget.dart';

class NewEpisodePage extends ConsumerWidget {
  const NewEpisodePage({super.key,});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = ref.watch(episodeContentProvider);

    return Column(
      children: [
        SearchBarForm(
          key: GlobalKey(),
          titleText: 'Search Episode',
          onSearch: (text) async {
            ref.read(listProvider.notifier).cleanList();
            ref.read(episodeContentProvider.notifier).state =
                EpisodePage(episodeId: text);
          },
        ),
        content,
      ],
    );
  }
}
