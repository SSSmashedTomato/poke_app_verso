import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_versotech/home/controller/connectivity_controller.dart';
import 'package:pokedex_versotech/home/controller/pokemon_controller.dart';
import 'package:pokedex_versotech/utils/utils.dart';
import 'package:http/http.dart' as http;

import 'home/presenters/pages/pokemon_detail_page.dart';
import 'home/presenters/pages/splash_page.dart';
import 'home/data/external/repository/pokemon_repository.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokedéx',
      theme: ThemeData(
        primaryColor: appMainColor,
        appBarTheme: const AppBarTheme(color: appMainColor),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => http.Client()),
        Bind.lazySingleton((i) => PokemonRepository(i())),
        Bind.lazySingleton(
          (i) => PokemonController(pokemonRepo: i.get()),
        ),
        Bind.singleton(
          (i) => ConnectivityController(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashPage()),
        ChildRoute('/detail_page',
            child: (_, args) => PokemonDetailPage(
                  imageUrl: args.data[0],
                  pokemon: args.data[1],
                )),
      ];
}
