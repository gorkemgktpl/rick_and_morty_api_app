import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'character_info_widget.dart';

class CharacterPage extends ConsumerWidget {
  final String characterId;
  const CharacterPage({super.key, required this.characterId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Character Info'),
      ),
      body: CharacterInfo(characterId: characterId),
    );
  }
}
