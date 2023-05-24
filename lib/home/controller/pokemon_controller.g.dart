// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonController on PokemonControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: 'PokemonControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$pokemonsAtom =
      Atom(name: 'PokemonControllerBase.pokemons', context: context);

  @override
  List<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$pokemonAtom =
      Atom(name: 'PokemonControllerBase.pokemon', context: context);

  @override
  Pokemon get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(Pokemon value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$hasIssueAtom =
      Atom(name: 'PokemonControllerBase.hasIssue', context: context);

  @override
  bool get hasIssue {
    _$hasIssueAtom.reportRead();
    return super.hasIssue;
  }

  @override
  set hasIssue(bool value) {
    _$hasIssueAtom.reportWrite(value, super.hasIssue, () {
      super.hasIssue = value;
    });
  }

  late final _$getAllPokemonAsyncAction =
      AsyncAction('PokemonControllerBase.getAllPokemon', context: context);

  @override
  Future<dynamic> getAllPokemon(int lenght) {
    return _$getAllPokemonAsyncAction.run(() => super.getAllPokemon(lenght));
  }

  late final _$getAllInfoAsyncAction =
      AsyncAction('PokemonControllerBase.getAllInfo', context: context);

  @override
  Future<Pokemon> getAllInfo(Pokemon pok, {String? id}) {
    return _$getAllInfoAsyncAction.run(() => super.getAllInfo(pok, id: id));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
pokemons: ${pokemons},
pokemon: ${pokemon},
hasIssue: ${hasIssue}
    ''';
  }
}
