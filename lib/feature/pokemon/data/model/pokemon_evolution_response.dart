import 'dart:collection';

import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_evolution_entity.dart';

class PokemonEvolutionResponse {
  String? babyTriggerItem;
  PokemonEvolutionResponseChain? chain;
  int? id;

  PokemonEvolutionResponse({this.babyTriggerItem, this.chain, this.id});

  PokemonEvolutionResponse.fromJson(Map<String, dynamic> json) {
    babyTriggerItem = json['baby_trigger_item']?.toString();
    chain = json['chain'] != null
        ? PokemonEvolutionResponseChain.fromJson(json['chain'])
        : null;
    id = int.tryParse(json['id']?.toString() ?? '');
  }

  List<PokemonEvolutionEntity> toEntity() {
    List<PokemonEvolutionEntity> result = [];
    void evolveRecursive(PokemonEvolutionResponseChain? data) {
      result.add(
        PokemonEvolutionEntity(
          id: _getId(data?.species?.url),
          name: data?.species?.name,
          level: data?.evolutionDetails?.firstOrNull?.minLevel,
        ),
      );

      final evolveTo = data?.evolvesTo ?? [];
      if (evolveTo.isNotEmpty) {
        for (final item in evolveTo) {
          evolveRecursive(item);
        }
      }
    }

    evolveRecursive(chain);
    return result;
  }

  String _getId(String? url) {
    final splitId = (url ?? '').split('/');
    return splitId[splitId.length - 2];
  }
}

class PokemonEvolutionResponseChain {
  List<PokemonEvolutionResponseChainEvolutionDetails?>? evolutionDetails;
  List<PokemonEvolutionResponseChain?>? evolvesTo;
  bool? isBaby;
  PokemonEvolutionResponseChainSpecies? species;

  PokemonEvolutionResponseChain({
    this.evolutionDetails,
    this.evolvesTo,
    this.isBaby,
    this.species,
  });

  PokemonEvolutionResponseChain.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails = <PokemonEvolutionResponseChainEvolutionDetails?>[];
      for (final v in json['evolution_details']) {
        evolutionDetails?.add(
          PokemonEvolutionResponseChainEvolutionDetails.fromJson(v),
        );
      }
    }
    if (json['evolves_to'] != null) {
      evolvesTo = <PokemonEvolutionResponseChain?>[];
      for (final v in json['evolves_to']) {
        evolvesTo?.add(PokemonEvolutionResponseChain.fromJson(v));
      }
    }
    isBaby = json['is_baby'];
    species = json['species'] != null
        ? PokemonEvolutionResponseChainSpecies.fromJson(json['species'])
        : null;
  }
}

class PokemonEvolutionResponseChainEvolutionDetails {
  String? baseFormId;
  String? gender;
  String? heldItem;
  String? item;
  String? knownMove;
  String? knownMoveType;
  String? location;
  String? minAffection;
  String? minBeauty;
  String? minHappiness;
  int? minLevel;
  bool? needsOverworldRain;
  String? partySpecies;
  String? partyType;
  String? regionId;
  String? relativePhysicalStats;
  String? timeOfDay;
  String? tradeSpecies;
  PokemonEvolutionResponseChainEvolutionDetailsTrigger? trigger;
  bool? turnUpsideDown;

  PokemonEvolutionResponseChainEvolutionDetails({
    this.baseFormId,
    this.gender,
    this.heldItem,
    this.item,
    this.knownMove,
    this.knownMoveType,
    this.location,
    this.minAffection,
    this.minBeauty,
    this.minHappiness,
    this.minLevel,
    this.needsOverworldRain,
    this.partySpecies,
    this.partyType,
    this.regionId,
    this.relativePhysicalStats,
    this.timeOfDay,
    this.tradeSpecies,
    this.trigger,
    this.turnUpsideDown,
  });

  PokemonEvolutionResponseChainEvolutionDetails.fromJson(
    Map<String, dynamic> json,
  ) {
    baseFormId = json['base_form_id']?.toString();
    gender = json['gender']?.toString();
    heldItem = json['held_item']?.toString();
    item = json['item']?.toString();
    knownMove = json['known_move']?.toString();
    knownMoveType = json['known_move_type']?.toString();
    location = json['location']?.toString();
    minAffection = json['min_affection']?.toString();
    minBeauty = json['min_beauty']?.toString();
    minHappiness = json['min_happiness']?.toString();
    minLevel = int.tryParse(json['min_level']?.toString() ?? '');
    needsOverworldRain = json['needs_overworld_rain'];
    partySpecies = json['party_species']?.toString();
    partyType = json['party_type']?.toString();
    regionId = json['region_id']?.toString();
    relativePhysicalStats = json['relative_physical_stats']?.toString();
    timeOfDay = json['time_of_day']?.toString();
    tradeSpecies = json['trade_species']?.toString();
    trigger = json['trigger'] != null
        ? PokemonEvolutionResponseChainEvolutionDetailsTrigger.fromJson(
            json['trigger'],
          )
        : null;
    turnUpsideDown = json['turn_upside_down'];
  }
}

class PokemonEvolutionResponseChainEvolutionDetailsTrigger {
  String? name;
  String? url;

  PokemonEvolutionResponseChainEvolutionDetailsTrigger({this.name, this.url});

  PokemonEvolutionResponseChainEvolutionDetailsTrigger.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonEvolutionResponseChainEvolvesToSpecies {
  String? name;
  String? url;

  PokemonEvolutionResponseChainEvolvesToSpecies({this.name, this.url});

  PokemonEvolutionResponseChainEvolvesToSpecies.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonEvolutionResponseChainSpecies {
  String? name;
  String? url;

  PokemonEvolutionResponseChainSpecies({this.name, this.url});

  PokemonEvolutionResponseChainSpecies.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}
