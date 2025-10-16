import 'package:equatable/equatable.dart';

class PokemonEvolutionEntity extends Equatable {
  final int? level;
  final String? name;
  final String? id;

  const PokemonEvolutionEntity({this.level, this.name, this.id});

  @override
  List<Object?> get props => [level, name, id];
}
