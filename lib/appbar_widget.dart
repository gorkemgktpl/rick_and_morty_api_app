import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, 
        icon: const Icon(Icons.arrow_back)),
        title: Text(title),);
  }
}