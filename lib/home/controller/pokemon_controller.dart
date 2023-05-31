import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/pokemon.dart';
import '../data/external/repository/pokemon_repository.dart';

part 'pokemon_controller.g.dart';

class PokemonController = PokemonControllerBase with _$PokemonController;

abstract class PokemonControllerBase with Store {
  //here is our changeNotifier whith can hold multiples states globaly on our app

  final IPokemonRepository pokemonRepo;

  PokemonControllerBase({required this.pokemonRepo});

  @observable
  bool loading = false;

  @observable
  List<Pokemon> pokemons = <Pokemon>[].asObservable();

  @observable
  Pokemon pokemon = Pokemon(
      name: 'name',
      url: 'url',
      pokemonTypeColor: const Color.fromARGB(255, 201, 79, 70));

  @observable
  bool hasIssue = false;

  @action
  Future getAllPokemon(int lenght) async {
    try {
      final fetchedPokemons = await pokemonRepo.getAllPok(lenght);
      for (var pokemon in fetchedPokemons) {
        pokemons.add(pokemon);
      }
    } catch (e) {
      hasIssue = true;
    }
  }

  @action
  Future<Pokemon> getAllInfo(Pokemon pok, {String? id}) async {
    try {
      final response = await pokemonRepo.getPokemonFullInfo(pok, pokeId: id);
      pokemon = response;
    } catch (e) {
      print(e);
    }
    return pokemon;
  }
}
