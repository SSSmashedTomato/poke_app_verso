import 'package:flutter/material.dart';
import '../widgets/components/components_exports.dart';
import '../widgets/components/pokemon_list_widget.dart';

class PokedexHomePage extends StatelessWidget {
  PokedexHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 150,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              PokemonHomeTitleWidget(),
            ],
          ),
        ),
        body: const PokemonListWidget());
  }
}
