import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pokedex_versotech/home/presenters/widgets/components/pokemon_stats_widget.dart';
import 'package:pokedex_versotech/utils/utils.dart';

import '../../../../shared/models/pokemon.dart';
import 'row_divider.dart';

class PokemonInfoData extends StatelessWidget {
  const PokemonInfoData({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var type in pokemon.types)
                TypePokemonLabel(
                  pokemon: pokemon,
                  type: type ?? '??',
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text('About',
              style: TextStyle(
                  color: pokemon.pokemonTypeColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 17)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          LineIcons.hangingWeight,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text('${pokemon.weight} kg')
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Weight',
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 11),
                    )
                  ],
                ),
                const RowDivider(height: 50, width: 2),
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          LineIcons.rulerVertical,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text('${pokemon.height} m')
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Height',
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 11),
                    )
                  ],
                ),
                const RowDivider(height: 50, width: 2),
                Column(
                  children: [
                    pokemon.moves.isNotEmpty
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (var i = 0;
                                  i < pokemon.moves.length && i < 2;
                                  i++)
                                Text(pokemon.moves[i] ??
                                    '??'.replaceAll('-', ' ').toCapitalized())
                            ],
                          )
                        : Container(),
                    const SizedBox(height: 15),
                    Text(
                      'Moves',
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 11),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Text('Here comes the pokemon info'),
          const SizedBox(height: 10),
          Text('Base Stats',
              style: TextStyle(
                  color: pokemon.pokemonTypeColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 17)),
          const SizedBox(height: 10),
          PokemonStatsWidget(pokemon: pokemon),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class TypePokemonLabel extends StatelessWidget {
  const TypePokemonLabel({
    Key? key,
    required this.pokemon,
    required this.type,
  }) : super(key: key);

  final Pokemon pokemon;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: pokemon.getTypeColor(type),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Center(
          child: Text(
            type.toCapitalized(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
