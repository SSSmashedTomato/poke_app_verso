import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_versotech/utils/utils.dart';

import '../../../../shared/models/pokemon.dart';

class PokemonCardWidget extends StatefulWidget {
  final Pokemon pokemon;
  final String id;
  final String imagUrl;
  final String name;
  const PokemonCardWidget({
    required this.pokemon,
    required this.imagUrl,
    required this.id,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonCardWidget> createState() => _PokemonCardWidgetState();
}

class _PokemonCardWidgetState extends State<PokemonCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/detail_page',
            arguments: [widget.imagUrl, widget.pokemon]);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          elevation: 5,
          child: Stack(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          color: Colors.white,
                        ),
                        //
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              border: Border.all(
                                  color: Colors.grey.shade200,
                                  style: BorderStyle.solid)),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 3,
                          child: CachedNetworkImage(
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  color: appMainColor,
                                  value: downloadProgress.progress),
                            ),
                            imageUrl: widget.imagUrl,
                            fit: BoxFit.cover,
                            height: 110,
                            width: 100,
                            fadeInDuration: const Duration(milliseconds: 150),
                            fadeOutDuration: const Duration(milliseconds: 150),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Text(
                  '#${widget.id}',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
