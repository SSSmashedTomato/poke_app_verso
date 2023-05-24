import 'package:flutter/material.dart';
import 'package:pokedex_versotech/home/presenters/widgets/components/pokemon_info_data.dart';

import '../../../../shared/models/pokemon.dart';

class PokemonContentWidget extends StatefulWidget {
  const PokemonContentWidget({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.pokemon,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final Pokemon pokemon;

  @override
  State<PokemonContentWidget> createState() => _PokemonContentWidgetState();
}

class _PokemonContentWidgetState extends State<PokemonContentWidget> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    return Positioned(
      bottom: 4,
      left: 4,
      right: 4,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(color: Colors.white, blurRadius: 3, spreadRadius: 9)
                ]),
            height: widget.screenHeight * 0.6,
            width: widget.screenWidth,
            child: loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 70,
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: PokemonInfoData(
                          pokemon: pokemon,
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }
}
