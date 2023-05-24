import 'package:flutter/material.dart';
import 'package:pokedex_versotech/home/presenters/widgets/components/pokemon_stat_row_widget.dart';
import '../../../../shared/models/pokemon.dart';

class PokemonStatsWidget extends StatelessWidget {
  const PokemonStatsWidget({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> stats = [];

    if (pokemon.hp != null) {
      stats = [
        {'statTitle': 'HP', 'statNumber': pokemon.hp!},
        {'statTitle': 'ATK', 'statNumber': pokemon.attack!},
        {'statTitle': 'DEF', 'statNumber': pokemon.defense!},
        {'statTitle': 'SATK', 'statNumber': pokemon.specialAttack!},
        {'statTitle': 'SDEF', 'statNumber': pokemon.specialDefence!},
        {'statTitle': 'SPD', 'statNumber': pokemon.speed!}
      ];
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          ...stats
              .map(
                (stat) => StatRowWidget(
                  color: pokemon.pokemonTypeColor!,
                  statTitle: stat['statTitle'],
                  statNumber: stat['statNumber'],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
