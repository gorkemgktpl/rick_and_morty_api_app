import 'package:flutter/material.dart';
import 'package:rick_and_morty/navigation/new_episode_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/providers/notifier.dart';
import 'new_character_page.dart';

class NavigationBarWidget extends ConsumerWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(pageIndexProvider);

    final List<Widget> pages = [
      const NewCharacterPage(),
      const NewEpisodePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
      ),
      body: IndexedStack(index: selectedIndex, children: pages,),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Character',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'Episode',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.teal[500],
          onTap: (index) {
            ref.read(pageIndexProvider.notifier).state = index;
          }),
    );
  }
}
