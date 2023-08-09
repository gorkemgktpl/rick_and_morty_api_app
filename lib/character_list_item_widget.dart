import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/route_generator.dart';
import 'model/character.dart';

class CharacterListItemWidget extends StatelessWidget {
  final Character character;
  const CharacterListItemWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('#${character.id} ${character.name}'),
      leading: CircleAvatar(
          backgroundImage: NetworkImage(character.image.toString())),
      subtitle: Text(character.species!),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        context.push(
          Routes.instance.characterPage(
            characterId: character.id.toString(),
          ),
        );

        /*
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CharacterPage(characterId: character.id.toString())));
                */
      },
    );
  }
}
