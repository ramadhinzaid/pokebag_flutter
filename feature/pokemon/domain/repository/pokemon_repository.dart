import 'package:fpdart/fpdart.dart';
import 'package:pokebag_flutter/core/utils/error_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_data_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<ErrorEntity, PokemonEntity>> getPokemons(String offset);
  Future<Either<ErrorEntity, PokemonDataEntity>> getPokemon(String id);
}
