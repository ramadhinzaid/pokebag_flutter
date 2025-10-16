import 'package:fpdart/fpdart.dart';
import 'package:pokebag_flutter/core/utils/error_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_data_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/repository/pokemon_repository.dart';

class PokemonDetailUsecase {
  final PokemonRepository _repository;
  PokemonDetailUsecase(this._repository);

  Future<Either<ErrorEntity, PokemonDataEntity>> call(String id) async =>
      await _repository.getPokemon(id);
}
