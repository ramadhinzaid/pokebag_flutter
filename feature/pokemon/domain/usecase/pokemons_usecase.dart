import 'package:fpdart/fpdart.dart';
import 'package:pokebag_flutter/core/utils/error_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/repository/pokemon_repository.dart';

class PokemonsUsecase {
  final PokemonRepository _repository;
  PokemonsUsecase(this._repository);

  Future<Either<ErrorEntity, PokemonEntity>> call(String offset) async =>
      await _repository.getPokemons(offset);
}
