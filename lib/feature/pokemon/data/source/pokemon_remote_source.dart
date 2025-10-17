import 'package:pokebag_flutter/core/config/api.dart';
import 'package:pokebag_flutter/feature/pokemon/data/model/pokemon_data_response.dart';
import 'package:pokebag_flutter/feature/pokemon/data/model/pokemon_evolution_response.dart';
import 'package:pokebag_flutter/feature/pokemon/data/model/pokemon_response.dart';
import 'package:pokebag_flutter/feature/pokemon/data/model/pokemon_species_response.dart';

abstract class PokemonRemoteSource {
  Future<PokemonResponse> getPokemons(String offset);
  Future<PokemonDataResponse> getPokemon(String id);
  Future<PokemonSpeciesResponse> getSpecies(String id);
  Future<PokemonEvolutionResponse> getEvolution(String id);
}

class PokemonRemoteSourceImpl extends PokemonRemoteSource {
  PokemonRemoteSourceImpl(this._api);
  final API _api;

  @override
  Future<PokemonDataResponse> getPokemon(String id) async {
    try {
      final result = await _api.get('/pokemon/$id');
      final response = PokemonDataResponse.fromJson(result.data);
      if (result.statusCode == 200) return response;
      throw ('not found');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonResponse> getPokemons(String offset) async {
    try {
      final result = await _api.get(
        '/pokemon/',
        params: {'offset': offset, 'limit': 24},
      );
      final response = PokemonResponse.fromJson(result.data);
      if (result.statusCode == 200) return response;
      throw ('something went wrong');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonSpeciesResponse> getSpecies(String id) async {
    try {
      final result = await _api.get('/pokemon-species/$id');
      final response = PokemonSpeciesResponse.fromJson(result.data);
      if (result.statusCode == 200) return response;
      throw ('not found');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonEvolutionResponse> getEvolution(String id) async {
    try {
      final result = await _api.get('/evolution-chain/$id');
      final response = PokemonEvolutionResponse.fromJson(result.data);
      if (result.statusCode == 200) return response;
      throw ('not found');
    } catch (e) {
      rethrow;
    }
  }
}
