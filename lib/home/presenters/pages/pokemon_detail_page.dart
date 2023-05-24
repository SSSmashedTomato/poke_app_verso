import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_versotech/home/controller/connectivity_controller.dart';
import 'package:pokedex_versotech/utils/utils.dart';
import '../../../shared/models/pokemon.dart';
import '../../controller/pokemon_controller.dart';
import '../widgets/components/pokemon_content_widget.dart';

class PokemonDetailPage extends StatefulWidget {
  static const String routeName = 'PokemonDetailPage';
  final Pokemon pokemon;
  final String imageUrl;

  const PokemonDetailPage({
    Key? key,
    required this.imageUrl,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late Pokemon resultPokemon;
  late String imageUrl;
  String pokemonId = '';
  String pokemonName = '';
  late PokemonController controller;
  late ConnectivityController connectivityController;
  PageController pageController = PageController();

  @override
  void initState() {
    controller = Modular.get();
    connectivityController = Modular.get();
    controller.loading = true;
    imageUrl = widget.imageUrl;
    _fetchPokeInfo();
    // controller.loading = false;
    super.initState();
  }

  void _onHorizontalDrag(DragEndDetails details) async {
    if (details.primaryVelocity == 0) return;

    if (details.primaryVelocity!.compareTo(0) == -1) {
      await _getNextPokemon();
    } else {
      if (controller.pokemon.id != '1') {
        await _getPrevPokemon();
      }
    }
  }

  Future<void> _fetchPokeInfo() async {
    if (connectivityController.isConnectionNotEmpty) {
      controller.loading = true;

      await controller.getAllInfo(widget.pokemon);

      controller.loading = false;
    }
  }

  Future _getPrevPokemon() async {
    if (connectivityController.isConnectionNotEmpty) {
      int oldId = int.parse(controller.pokemon.id!);

      String idToGetPhoto = '';
      String idToApi = (int.parse(controller.pokemon.id!) - 1).toString();
      if (oldId >= 100) {
        idToGetPhoto = (int.parse(controller.pokemon.id!) - 1).toString();
      } else {
        idToGetPhoto =
            (int.parse(controller.pokemon.id!) - 1).toString().padLeft(3, '0');
      }
      controller.loading = true;
      setState(() {
        imageUrl =
            'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${idToGetPhoto}.png';
      });

      await controller.getAllInfo(widget.pokemon, id: idToApi);
      controller.loading = false;
    }
  }

  Future _getNextPokemon() async {
    if (connectivityController.isConnectionNotEmpty) {
      controller.loading = true;
      int oldId = int.parse(controller.pokemon.id!);

      String idToGetPhoto = '';
      String idToApi = (int.parse(controller.pokemon.id!) + 1).toString();

      if (oldId >= 100) {
        idToGetPhoto = (int.parse(controller.pokemon.id!) + 1).toString();
      } else {
        idToGetPhoto =
            (int.parse(controller.pokemon.id!) + 1).toString().padLeft(3, '0');
      }

      setState(() {
        imageUrl =
            'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$idToGetPhoto.png';
      });

      await controller.getAllInfo(widget.pokemon, id: idToApi);
      controller.loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Observer(
            builder: (_) => controller.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    onHorizontalDragEnd: (DragEndDetails details) =>
                        _onHorizontalDrag(details),
                    child: Container(
                        color: controller.pokemon.pokemonTypeColor,
                        height: double.infinity,
                        width: double.infinity,
                        child: Column(
                          children: [
                            // get status bar height and top screen padding
                            SizedBox(
                                height: MediaQuery.of(context).viewPadding.top +
                                    20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            Modular.to.pop(context);
                                          },
                                          iconSize: 38,
                                          icon: const Icon(
                                            Icons.arrow_back_rounded,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(width: 10),
                                      Text(
                                          controller.pokemon.name
                                              .toCapitalized(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                    ],
                                  ),
                                  if (int.tryParse(controller.pokemon.id!)! >=
                                          10 &&
                                      int.tryParse(controller.pokemon.id!)! <
                                          100)
                                    Text('#0${controller.pokemon.id}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 17)),
                                  if (int.tryParse(controller.pokemon.id!)! >=
                                      100)
                                    Text('#${controller.pokemon.id}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 17)),
                                  if (int.tryParse(controller.pokemon.id!)! <
                                      10)
                                    Text('#00${controller.pokemon.id}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 17)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  PokemonContentWidget(
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    pokemon: controller.pokemon,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Visibility(
                                          visible: controller.pokemon.id != "1",
                                          child: IconButton(
                                            iconSize: 18,
                                            onPressed: () async {
                                              await _getPrevPokemon();
                                            },
                                            icon: const Icon(
                                              Icons.arrow_back_ios_sharp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                            height: screenHeight * 0.38,
                                            width: screenWidth,
                                            child: Hero(
                                              tag: pokemonName.toCapitalized(),
                                              child: CachedNetworkImage(
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: appMainColor,
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                ),
                                                imageUrl: imageUrl,
                                                fit: BoxFit.contain,
                                                height: 110,
                                                width: 100,
                                                fadeInDuration: const Duration(
                                                    milliseconds: 150),
                                                fadeOutDuration: const Duration(
                                                    milliseconds: 150),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: IconButton(
                                          iconSize: 18,
                                          onPressed: () async {
                                            await _getNextPokemon();
                                          },
                                          icon: const Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  )));
  }
}
