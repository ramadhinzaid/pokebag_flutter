import 'package:equatable/equatable.dart';
import 'package:pokebag_flutter/core/utils/error_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_data_entity.dart';

class PokemonState extends Equatable {
  final List<PokemonDataEntity?>? pokemons;
  final String? next;
  final String? current;
  final bool loadMore;
  final ErrorEntity? error;

  const PokemonState({
    this.pokemons,
    this.next,
    this.current,
    this.loadMore = false,
    this.error,
  });
  @override
  List<Object?> get props => [pokemons, next, current, loadMore, error];

  PokemonState copyWith({
    List<PokemonDataEntity?>? pokemons,
    String? next,
    ErrorEntity? error,
    bool? loadMore,
    String? current,
  }) => PokemonState(
    pokemons: pokemons ?? this.pokemons,
    next: next ?? this.next,
    error: error,
    loadMore: loadMore ?? false,
    current: current ?? this.current,
  );
}
