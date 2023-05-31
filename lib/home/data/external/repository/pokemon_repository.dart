import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../utils/api_calls.dart';
import '../../../../utils/erros.dart';
import '../../../../shared/models/pokemon.dart';

abstract class IPokemonRepository {
  IPokemonRepository(Object object);

  Future<List<Pokemon>> getAllPok(int lenght);
  Future<Pokemon> getPokemonFullInfo(Pokemon pokemon, {String? pokeId});
}

class PokemonRepository implements IPokemonRepository {
  final http.Client httpClient;

  PokemonRepository(this.httpClient);

  @override
  Future<List<Pokemon>> getAllPok(int lenght) async {
    List<Pokemon> result = [];

    try {
      if (lenght >= 1000) {
        return result;
      }
      Uri basicUrl = Uri.https(ApiCalls.authority, ApiCalls.unencodedPath,
          {'limit': '20', 'offset': lenght.toString()});
      final response = await httpClient
          .get(basicUrl)
          .timeout(const Duration(seconds: 5), onTimeout: () {
        return http.Response('Error', 408);
      });
      List<dynamic> fetchedData = [];
      if (response.statusCode == 200) {
        fetchedData = json.decode(response.body)['results'];

        for (var pokemon in fetchedData) {
          final pokemonName = pokemon['name'].substring(0, 1).toUpperCase() +
              pokemon['name'].substring(1);

          result.add(Pokemon(name: pokemonName, url: pokemon['url']));
        }
      }
      return result;
    } on TimeoutException catch (e) {
      throw TimeOutError(e.toString());
    } catch (e) {
      throw RequisitionError(e.toString());
    }
  }

  @override
  Future<Pokemon> getPokemonFullInfo(Pokemon pokemon, {String? pokeId}) async {
    String pokemonNameLowerCase =
        pokeId == null ? pokemon.name.toLowerCase() : pokeId.toString();
    Pokemon pokemonFinal = Pokemon(name: pokemon.name, url: pokemon.url);
    try {
      final Uri url = Uri.https(ApiCalls.authority,
          '${ApiCalls.unencodedPath}/$pokemonNameLowerCase');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var pokemonData = json.decode(response.body);
        List statsData = pokemonData['stats'];
        List pokeTypes = pokemonData['types'];
        List pokeMoves = pokemonData['moves'];

        for (var types in pokeTypes) {
          pokemonFinal.types.add(types['type']['name']);
        }
        for (var moves in pokeMoves) {
          pokemonFinal.moves.add(moves['move']['name']);
        }
        pokemonFinal.name = pokemonData['name'].toString();
        pokemonFinal.height = pokemonData['height'].toString();
        pokemonFinal.weight = pokemonData['weight'].toString();
        pokemonFinal.id = pokemonData['id'].toString();
        pokemonFinal.pokemonTypeColor =
            pokemonFinal.getTypeColor(pokeTypes[0]['type']['name'].toString());
        pokemonFinal.hp = statsData[0]['base_stat'];
        pokemonFinal.attack = statsData[1]['base_stat'];
        pokemonFinal.defense = statsData[2]['base_stat'];
        pokemonFinal.specialAttack = statsData[3]['base_stat'];
        pokemonFinal.specialDefence = statsData[4]['base_stat'];
        pokemonFinal.speed = statsData[5]['base_stat'];
      }
      return pokemonFinal;
    } catch (error) {
      rethrow;
    }
  }
}
