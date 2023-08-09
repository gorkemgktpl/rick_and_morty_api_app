import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/providers/notifier.dart';
import 'package:rick_and_morty/search_bar_widget.dart';
import '../character_info_widget.dart';

class NewCharacterPage extends ConsumerWidget {
  const NewCharacterPage({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = ref.watch(characterContentProvider);

    return Column(
      children: [
        SearchBarForm(
          key: GlobalKey(),
          titleText: 'Search Character',
          onSearch: (text) async {
            ref.read(characterContentProvider.notifier).state =
                CharacterInfo(characterId: text);
          },
        ),
        content,
      ],
    );
  }
}
