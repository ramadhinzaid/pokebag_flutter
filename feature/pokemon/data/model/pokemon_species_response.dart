class PokemonSpeciesResponse {
  int? baseHappiness;
  int? captureRate;
  PokemonSpeciesResponseColor? color;
  List<PokemonSpeciesResponseEggGroups?>? eggGroups;
  PokemonSpeciesResponseEvolutionChain? evolutionChain;
  String? evolvesFromSpecies;
  List<PokemonSpeciesResponseFlavorTextEntries?>? flavorTextEntries;
  List<String?>? formDescriptions;
  bool? formsSwitchable;
  int? genderRate;
  List<PokemonSpeciesResponseGenera?>? genera;
  PokemonSpeciesResponseGeneration? generation;
  PokemonSpeciesResponseGrowthRate? growthRate;
  PokemonSpeciesResponseHabitat? habitat;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  List<PokemonSpeciesResponseNames?>? names;
  int? order;
  List<PokemonSpeciesResponsePalParkEncounters?>? palParkEncounters;
  List<PokemonSpeciesResponsePokedexNumbers?>? pokedexNumbers;
  PokemonSpeciesResponseShape? shape;
  List<PokemonSpeciesResponseVarieties?>? varieties;

  PokemonSpeciesResponse({
    this.baseHappiness,
    this.captureRate,
    this.color,
    this.eggGroups,
    this.evolutionChain,
    this.evolvesFromSpecies,
    this.flavorTextEntries,
    this.formDescriptions,
    this.formsSwitchable,
    this.genderRate,
    this.genera,
    this.generation,
    this.growthRate,
    this.habitat,
    this.hasGenderDifferences,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.names,
    this.order,
    this.palParkEncounters,
    this.pokedexNumbers,
    this.shape,
    this.varieties,
  });

  PokemonSpeciesResponse.fromJson(Map<String, dynamic> json) {
    baseHappiness = int.tryParse(json['base_happiness']?.toString() ?? '');
    captureRate = int.tryParse(json['capture_rate']?.toString() ?? '');
    color = json['color'] != null
        ? PokemonSpeciesResponseColor.fromJson(json['color'])
        : null;
    if (json['egg_groups'] != null) {
      eggGroups = <PokemonSpeciesResponseEggGroups?>[];
      for (final v in json['egg_groups']) {
        eggGroups?.add(PokemonSpeciesResponseEggGroups.fromJson(v));
      }
    }
    evolutionChain = json['evolution_chain'] != null
        ? PokemonSpeciesResponseEvolutionChain.fromJson(json['evolution_chain'])
        : null;
    evolvesFromSpecies = json['evolves_from_species']?.toString();
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <PokemonSpeciesResponseFlavorTextEntries?>[];
      for (final v in json['flavor_text_entries']) {
        flavorTextEntries?.add(
          PokemonSpeciesResponseFlavorTextEntries.fromJson(v),
        );
      }
    }
    if (json['form_descriptions'] != null) {
      formDescriptions = <String?>[];
      for (final v in json['form_descriptions']) {
        formDescriptions?.add(v);
      }
    }
    formsSwitchable = json['forms_switchable'];
    genderRate = int.tryParse(json['gender_rate']?.toString() ?? '');
    if (json['genera'] != null) {
      genera = <PokemonSpeciesResponseGenera?>[];
      for (final v in json['genera']) {
        genera?.add(PokemonSpeciesResponseGenera.fromJson(v));
      }
    }
    generation = json['generation'] != null
        ? PokemonSpeciesResponseGeneration.fromJson(json['generation'])
        : null;
    growthRate = json['growth_rate'] != null
        ? PokemonSpeciesResponseGrowthRate.fromJson(json['growth_rate'])
        : null;
    habitat = json['habitat'] != null
        ? PokemonSpeciesResponseHabitat.fromJson(json['habitat'])
        : null;
    hasGenderDifferences = json['has_gender_differences'];
    hatchCounter = int.tryParse(json['hatch_counter']?.toString() ?? '');
    id = int.tryParse(json['id']?.toString() ?? '');
    isBaby = json['is_baby'];
    isLegendary = json['is_legendary'];
    isMythical = json['is_mythical'];
    name = json['name']?.toString();
    if (json['names'] != null) {
      names = <PokemonSpeciesResponseNames?>[];
      for (final v in json['names']) {
        names?.add(PokemonSpeciesResponseNames.fromJson(v));
      }
    }
    order = int.tryParse(json['order']?.toString() ?? '');
    if (json['pal_park_encounters'] != null) {
      palParkEncounters = <PokemonSpeciesResponsePalParkEncounters?>[];
      for (final v in json['pal_park_encounters']) {
        palParkEncounters?.add(
          PokemonSpeciesResponsePalParkEncounters.fromJson(v),
        );
      }
    }
    if (json['pokedex_numbers'] != null) {
      pokedexNumbers = <PokemonSpeciesResponsePokedexNumbers?>[];
      for (final v in json['pokedex_numbers']) {
        pokedexNumbers?.add(PokemonSpeciesResponsePokedexNumbers.fromJson(v));
      }
    }
    shape = json['shape'] != null
        ? PokemonSpeciesResponseShape.fromJson(json['shape'])
        : null;
    if (json['varieties'] != null) {
      varieties = <PokemonSpeciesResponseVarieties?>[];
      for (final v in json['varieties']) {
        varieties?.add(PokemonSpeciesResponseVarieties.fromJson(v));
      }
    }
  }

  String get chain {
    final split = (evolutionChain?.url ?? '').split('/');

    return split[split.length - 2];
  }

  String get toEntity =>
      genera?.firstWhere((e) => e?.language?.name == 'en')?.genus ?? '';
}

class PokemonSpeciesResponseColor {
  String? name;
  String? url;

  PokemonSpeciesResponseColor({this.name, this.url});

  PokemonSpeciesResponseColor.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseEggGroups {
  String? name;
  String? url;

  PokemonSpeciesResponseEggGroups({this.name, this.url});

  PokemonSpeciesResponseEggGroups.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseEvolutionChain {
  String? url;

  PokemonSpeciesResponseEvolutionChain({this.url});

  PokemonSpeciesResponseEvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseFlavorTextEntries {
  String? flavorText;
  PokemonSpeciesResponseFlavorTextEntriesLanguage? language;
  PokemonSpeciesResponseFlavorTextEntriesVersion? version;

  PokemonSpeciesResponseFlavorTextEntries({
    this.flavorText,
    this.language,
    this.version,
  });

  PokemonSpeciesResponseFlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text']?.toString();
    language = json['language'] != null
        ? PokemonSpeciesResponseFlavorTextEntriesLanguage.fromJson(
            json['language'],
          )
        : null;
    version = json['version'] != null
        ? PokemonSpeciesResponseFlavorTextEntriesVersion.fromJson(
            json['version'],
          )
        : null;
  }
}

class PokemonSpeciesResponseFlavorTextEntriesLanguage {
  String? name;
  String? url;

  PokemonSpeciesResponseFlavorTextEntriesLanguage({this.name, this.url});

  PokemonSpeciesResponseFlavorTextEntriesLanguage.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseFlavorTextEntriesVersion {
  String? name;
  String? url;

  PokemonSpeciesResponseFlavorTextEntriesVersion({this.name, this.url});

  PokemonSpeciesResponseFlavorTextEntriesVersion.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseGenera {
  String? genus;
  PokemonSpeciesResponseGeneraLanguage? language;

  PokemonSpeciesResponseGenera({this.genus, this.language});

  PokemonSpeciesResponseGenera.fromJson(Map<String, dynamic> json) {
    genus = json['genus']?.toString();
    language = json['language'] != null
        ? PokemonSpeciesResponseGeneraLanguage.fromJson(json['language'])
        : null;
  }
}

class PokemonSpeciesResponseGeneraLanguage {
  String? name;
  String? url;

  PokemonSpeciesResponseGeneraLanguage({this.name, this.url});

  PokemonSpeciesResponseGeneraLanguage.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseGeneration {
  String? name;
  String? url;

  PokemonSpeciesResponseGeneration({this.name, this.url});

  PokemonSpeciesResponseGeneration.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseGrowthRate {
  String? name;
  String? url;

  PokemonSpeciesResponseGrowthRate({this.name, this.url});

  PokemonSpeciesResponseGrowthRate.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseHabitat {
  String? name;
  String? url;

  PokemonSpeciesResponseHabitat({this.name, this.url});

  PokemonSpeciesResponseHabitat.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseNames {
  PokemonSpeciesResponseNamesLanguage? language;
  String? name;

  PokemonSpeciesResponseNames({this.language, this.name});

  PokemonSpeciesResponseNames.fromJson(Map<String, dynamic> json) {
    language = json['language'] != null
        ? PokemonSpeciesResponseNamesLanguage.fromJson(json['language'])
        : null;
    name = json['name']?.toString();
  }
}

class PokemonSpeciesResponseNamesLanguage {
  String? name;
  String? url;

  PokemonSpeciesResponseNamesLanguage({this.name, this.url});

  PokemonSpeciesResponseNamesLanguage.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponsePalParkEncounters {
  PokemonSpeciesResponsePalParkEncountersArea? area;
  int? baseScore;
  int? rate;

  PokemonSpeciesResponsePalParkEncounters({
    this.area,
    this.baseScore,
    this.rate,
  });

  PokemonSpeciesResponsePalParkEncounters.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null
        ? PokemonSpeciesResponsePalParkEncountersArea.fromJson(json['area'])
        : null;
    baseScore = int.tryParse(json['base_score']?.toString() ?? '');
    rate = int.tryParse(json['rate']?.toString() ?? '');
  }
}

class PokemonSpeciesResponsePalParkEncountersArea {
  String? name;
  String? url;

  PokemonSpeciesResponsePalParkEncountersArea({this.name, this.url});

  PokemonSpeciesResponsePalParkEncountersArea.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponsePokedexNumbers {
  int? entryNumber;
  PokemonSpeciesResponsePokedexNumbersPokedex? pokedex;

  PokemonSpeciesResponsePokedexNumbers({this.entryNumber, this.pokedex});

  PokemonSpeciesResponsePokedexNumbers.fromJson(Map<String, dynamic> json) {
    entryNumber = int.tryParse(json['entry_number']?.toString() ?? '');
    pokedex = json['pokedex'] != null
        ? PokemonSpeciesResponsePokedexNumbersPokedex.fromJson(json['pokedex'])
        : null;
  }
}

class PokemonSpeciesResponsePokedexNumbersPokedex {
  String? name;
  String? url;

  PokemonSpeciesResponsePokedexNumbersPokedex({this.name, this.url});

  PokemonSpeciesResponsePokedexNumbersPokedex.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseShape {
  String? name;
  String? url;

  PokemonSpeciesResponseShape({this.name, this.url});

  PokemonSpeciesResponseShape.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonSpeciesResponseVarieties {
  bool? isDefault;
  PokemonSpeciesResponseVarietiesPokemon? pokemon;

  PokemonSpeciesResponseVarieties({this.isDefault, this.pokemon});

  PokemonSpeciesResponseVarieties.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    pokemon = json['pokemon'] != null
        ? PokemonSpeciesResponseVarietiesPokemon.fromJson(json['pokemon'])
        : null;
  }
}

class PokemonSpeciesResponseVarietiesPokemon {
  String? name;
  String? url;

  PokemonSpeciesResponseVarietiesPokemon({this.name, this.url});

  PokemonSpeciesResponseVarietiesPokemon.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}
