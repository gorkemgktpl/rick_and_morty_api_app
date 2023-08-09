import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/providers/provider.dart';

class CharacterInfo extends ConsumerWidget {
  final String characterId;
  const CharacterInfo({super.key , required this.characterId});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.watch(characterProvider(characterId));

    return character.when(
      error: ((error, stackTrace) => Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Center(
                child: Text(data.name.toString(),
                    style: const TextStyle(fontSize: 30))),
            const SizedBox(height: 20),
            SizedBox(
                height: 200,
                child: Image(image: NetworkImage(data.image.toString()))),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Column(
                children: [
                  _buildInfoRow('Name:', data.name),
                  _buildInfoRow('Status:', data.status),
                  _buildInfoRow('Species:', data.species),
                  _buildInfoRow('Gender:', data.gender),
                ],
              ),
            )
          ]),
        );
      },
    );
  }
}

_buildInfoRow( String label, dynamic value){
    return Row(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        const SizedBox(width: 5,),
        Text(value, style: const TextStyle(fontSize: 20),),
      ],
    );
}
  