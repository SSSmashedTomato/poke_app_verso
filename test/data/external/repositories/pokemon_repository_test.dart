import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:pokedex_versotech/shared/models/pokemon.dart';
import 'package:pokedex_versotech/home/data/external/repository/pokemon_repository.dart';

import 'pokemon_repository_test.mocks.dart';

@GenerateMocks([http.Client, IPokemonRepository])
void main() {
  group('getAllPokemon', () {
    test('returns a List of Pokemon if the http call completes successfully',
        () async {
      final repository = MockIPokemonRepository();

      when(repository.getAllPok(20)).thenAnswer((_) async => <Pokemon>[
            Pokemon(
                name: 'charmander',
                url: 'https://pokeapi.co/api/v2/pokemon/21/'),
          ]);

      expect(await repository.getAllPok(20), isA<List<Pokemon>>());
    });

    test('throws an exception if the http call completes with an error',
        () async {
      final repository = MockIPokemonRepository();
      when(repository.getAllPok(20)).thenThrow(ArgumentError());

      expect(() => repository.getAllPok(20), throwsArgumentError);
    });
  });
  group('getSinglePokemon', () {
    test('returns a List of Pokemon if the http call completes successfully',
        () async {
      final repository = MockIPokemonRepository();
      final pokemon = Pokemon(name: 'bulbasaur', url: 'url');

      when(repository.getPokemonFullInfo(pokemon))
          .thenAnswer((_) async => Pokemon(
                name: 'bulbasaur',
                url: pokemon.url,
              ));

      expect(await repository.getPokemonFullInfo(pokemon), isA<Pokemon>());
    });

    test('throws an exception if the pokemon name is empty', () async {
      final repository = MockIPokemonRepository();
      final pokemon = Pokemon(name: '', url: 'url');
      when(repository.getPokemonFullInfo(pokemon)).thenThrow(ArgumentError());

      expect(() => repository.getPokemonFullInfo(pokemon), throwsArgumentError);
    });
  });
}
