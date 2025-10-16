import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
  @override
  List<Object?> get props => [];
}

class PokemonList extends PokemonEvent {
  final String? offset;

  const PokemonList(this.offset);

  @override
  List<Object?> get props => [offset];
}
