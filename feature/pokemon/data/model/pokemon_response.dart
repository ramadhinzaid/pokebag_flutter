import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_data_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_entity.dart';

class PokemonResponse {
  int? count;
  String? next;
  String? previous;
  List<PokemonResponseResults?>? results;

  PokemonResponse({this.count, this.next, this.previous, this.results});

  PokemonResponse.fromJson(Map<String, dynamic> json) {
    count = int.tryParse(json['count']?.toString() ?? '');
    next = json['next']?.toString();
    previous = json['previous']?.toString();
    if (json['results'] != null) {
      results = <PokemonResponseResults?>[];
      for (final v in json['results']) {
        results?.add(PokemonResponseResults.fromJson(v));
      }
    }
  }

  PokemonEntity toEntity() => PokemonEntity(
    count: count,
    next: Uri.tryParse(next ?? ''),
    previous: Uri.tryParse(previous ?? ''),
    dataDetail: results
        ?.map((e) => PokemonDataEntity(id: e?.url, name: e?.name))
        .toList(),
  );
}

class PokemonResponseResults {
  String? name;
  String? url;

  PokemonResponseResults({this.name, this.url});

  PokemonResponseResults.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}
