import 'package:fpdart/fpdart.dart';
import 'package:pokebag_flutter/core/utils/error_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/data/model/pokemon_species_response.dart';
import 'package:pokebag_flutter/feature/pokemon/data/source/pokemon_remote_source.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_data_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_evolution_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl(this._source);
  final PokemonRemoteSource _source;
  @override
  Future<Either<ErrorEntity, PokemonDataEntity>> getPokemon(String id) async {
    try {
      final result = await _source.getPokemon(id);
      final species = await _getSpecies(id);
      final evolves = await _getEvolves(species?.chain ?? '');
      return Right(
        result.toEntity(species: species?.toEntity, evolves: evolves),
      );
    } catch (e) {
      return Left(ErrorEntity(error: e));
    }
  }

  Future<PokemonSpeciesResponse?> _getSpecies(String id) async {
    try {
      final species = await _source.getSpecies(id);
      return species;
    } catch (e) {
      return null;
    }
  }

  Future<List<PokemonEvolutionEntity?>?> _getEvolves(String id) async {
    try {
      final evolves = await _source.getEvolution(id);
      return evolves.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<ErrorEntity, PokemonEntity>> getPokemons(String offset) async {
    try {
      final result = await _source.getPokemons(offset);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ErrorEntity(error: e));
    }
  }
}
