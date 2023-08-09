import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/episode.dart';

class EpisodeInfoWidget extends StatelessWidget {
  final Episode episode;
  const EpisodeInfoWidget({super.key , required this.episode});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Center(
              child: Text(
                episode.name.toString(),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Text(episode.airDate.toString()),
            const SizedBox(
              height: 30,
            ),
          ],
        );
  }
}
