import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../utils/utils.dart';
import '../../../controller/pokemon_controller.dart';
import 'bottom_loading_widget.dart';
import 'custom_grid_view.dart';

class PokemonListWidget extends StatefulWidget {
  const PokemonListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonListWidget> createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  final _scrollController = ScrollController();
  int offset = 0;
  bool atBottom = false;
  bool loadData = false;
  late PokemonController controller;

  @override
  void initState() {
    controller = Modular.get();
    fetchPokemons();
    pokemonLazyLoading();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Stack(children: [
        Container(color: appMainColor),
        Padding(
            padding: const EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                child: controller.hasIssue
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const PsyduckErrorWidget(),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: appMainColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: !controller.loading
                                      ? () async {
                                          controller.hasIssue = false;
                                          controller.loading = true;
                                          await fetchPokemons();
                                          await pokemonLazyLoading();
                                          controller.loading = false;
                                        }
                                      : null,
                                  child: const Text("Tentar Outra vez")),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomScrollView(
                            physics: const BouncingScrollPhysics(),
                            controller: _scrollController,
                            slivers: [
                              CustomGridView(controller: controller),
                              if (atBottom && loadData && !controller.hasIssue)
                                const BottomLoadingWidget(),
                              if (atBottom && !loadData)
                                const SliverToBoxAdapter(
                                    child: SizedBox(height: 15))
                            ]),
                      ),
              ),
            ))
      ]);
    });
  }

  Future<void> fetchPokemons() async {
    await controller.getAllPokemon(offset);
  }

  Future<void> pokemonLazyLoading() async {
    setState(() {
      atBottom = true;
      loadData = true;
    });
    //addListener is one of the three forms to consuming ChangeNotifier

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (!isTop) {
          offset += 20;
          fetchPokemons();
        }
      } else if (offset >= 980) {
        setState(() {
          loadData = false;
          atBottom = false;
        });
      }
    });
  }
}

class PsyduckErrorWidget extends StatelessWidget {
  const PsyduckErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300, //MediaQuery.of(context).size.height * 0.5,
        width: 300, //MediaQuery.of(context).size.width * 0.5,
        child: Column(children: [
          Stack(children: [
            SizedBox(
              width: 500,
              height: 70,
              child: Image.asset(
                'assets/chat_image.png',
                fit: BoxFit.fill,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, right: 5, left: 5),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Ops, ocorreu um erro!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
          Flexible(flex: 2, child: Image.asset('assets/psyduck.png')),
        ]));
  }
}
