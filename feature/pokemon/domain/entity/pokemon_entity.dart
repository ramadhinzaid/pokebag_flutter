import 'package:equatable/equatable.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_data_entity.dart';

class PokemonEntity extends Equatable {
  final int? count;
  final Uri? next;
  final Uri? previous;
  final List<PokemonDataEntity>? dataDetail;

  const PokemonEntity({this.count, this.next, this.previous, this.dataDetail});

  @override
  List<Object?> get props => [count, next, previous, dataDetail];
}
