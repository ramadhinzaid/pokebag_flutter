import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokebag_flutter/core/utils/extension_custom.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_evolution_entity.dart';

class PokemonDataEntity extends Equatable {
  final String? id;
  final String? name;
  final String? img;
  final int? height;
  final int? weight;
  final String? species;
  final List<PokemonEvolutionEntity?>? evolves;
  final List<String?>? abilities;
  final List<PokemonDataEntityTypes?>? types;
  final List<PokemonDataEntityMoves?>? moves;
  final List<PokemonDataEntityStats?>? stats;

  const PokemonDataEntity({
    this.id,
    this.name,
    this.img,
    this.height,
    this.weight,
    this.species,
    this.evolves,
    this.abilities,
    this.types,
    this.moves,
    this.stats,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    img,
    weight,
    height,
    species,
    evolves,
    abilities,
    types,
    moves,
    stats,
  ];
}

class PokemonDataEntityTypes extends Equatable {
  final String? id;
  final String? name;

  const PokemonDataEntityTypes({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}

class PokemonDataEntityMoves extends Equatable {
  final String? id;
  final String? name;

  const PokemonDataEntityMoves({this.id, this.name});

  String? get formatName {
    if ((name ?? '').contains('-')) {
      return (name ?? '').split('-').map((e) => e.caps).join(' ');
    }
    return name.caps;
  }

  @override
  List<Object?> get props => [id, name];
}

class PokemonDataEntityStats extends Equatable {
  final String? name;
  final int? point;

  const PokemonDataEntityStats({this.name, this.point});

  String? get formatName {
    if (name?.length == 2) {
      return name?.toUpperCase();
    } else if ((name ?? '').contains('-')) {
      final split = (name ?? '')
          .split('-')
          .mapWithIndex(
            (e, id) =>
                id == 0 ? '${e.caps.substring(0, 2)}.' : e.caps.substring(0, 3),
          )
          .join(' ');

      return split;
    }
    return name.caps;
  }

  @override
  List<Object?> get props => [name, point];
}
