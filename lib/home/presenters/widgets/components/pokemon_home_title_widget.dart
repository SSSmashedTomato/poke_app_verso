import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

class PokemonHomeTitleWidget extends StatelessWidget {
  const PokemonHomeTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisSize: MainAxisSize.max, children: const [
          Icon(
            Icons.catching_pokemon_outlined,
            size: 40,
          ),
          SizedBox(width: 20),
          Text(
            'Pokedéx',
            style: titleFont,
          )
        ]),
        const Text(
          'Bem Vindo Treinador',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
