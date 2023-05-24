import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_versotech/home/presenters/widgets/components/pokemon_card.dart';

import '../../../../shared/models/pokemon.dart';
import '../../../controller/pokemon_controller.dart';

class CustomGridView extends StatelessWidget {
  final PokemonController controller;

  const CustomGridView({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      List<Pokemon> pokemons = controller.pokemons;

      return SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            final pokemon = pokemons[index];
            String pokemonIdPadLeft = '';
            pokemonIdPadLeft = (index + 1).toString().padLeft(3, '0');
            String imageUrl =
                'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$pokemonIdPadLeft.png';

            return PokemonCardWidget(
                pokemon: pokemon,
                id: pokemonIdPadLeft,
                imagUrl: imageUrl,
                name: pokemon.name);
          }, childCount: pokemons.length),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 200,
          ));
    });
  }
}
