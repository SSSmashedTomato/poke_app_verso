import 'package:flutter/material.dart';
import '../widgets/components/components_exports.dart';
import '../widgets/components/pokemon_list_widget.dart';

class PokedexHomePage extends StatelessWidget {
  const PokedexHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 150,
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PokemonHomeTitleWidget(),
            ],
          ),
        ),
        body: const PokemonListWidget());
  }
}
