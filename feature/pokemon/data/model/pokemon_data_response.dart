import 'package:pokebag_flutter/core/utils/extension_custom.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_data_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_evolution_entity.dart';

class PokemonDataResponse {
  List<PokemonDataResponseAbilities?>? abilities;
  int? baseExperience;
  PokemonDataResponseCries? cries;
  List<PokemonDataResponseForms?>? forms;
  List<PokemonDataResponseGameIndices?>? gameIndices;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<PokemonDataResponseMoves?>? moves;
  String? name;
  int? order;
  List<PokemonDataResponsePastAbilities?>? pastAbilities;
  PokemonDataResponseSpecies? species;
  PokemonDataResponseSprites? sprites;
  List<PokemonDataResponseStats?>? stats;
  List<PokemonDataResponseTypes?>? types;
  int? weight;

  PokemonDataResponse({
    this.abilities,
    this.baseExperience,
    this.cries,
    this.forms,
    this.gameIndices,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastAbilities,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  PokemonDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <PokemonDataResponseAbilities?>[];
      for (final v in json['abilities']) {
        abilities?.add(PokemonDataResponseAbilities.fromJson(v));
      }
    }
    baseExperience = int.tryParse(json['base_experience']?.toString() ?? '');
    cries = json['cries'] != null
        ? PokemonDataResponseCries.fromJson(json['cries'])
        : null;
    if (json['forms'] != null) {
      forms = <PokemonDataResponseForms?>[];
      for (final v in json['forms']) {
        forms?.add(PokemonDataResponseForms.fromJson(v));
      }
    }
    if (json['game_indices'] != null) {
      gameIndices = <PokemonDataResponseGameIndices?>[];
      for (final v in json['game_indices']) {
        gameIndices?.add(PokemonDataResponseGameIndices.fromJson(v));
      }
    }
    height = int.tryParse(json['height']?.toString() ?? '');

    id = int.tryParse(json['id']?.toString() ?? '');
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters']?.toString();
    if (json['moves'] != null) {
      moves = <PokemonDataResponseMoves?>[];
      for (final v in json['moves']) {
        moves?.add(PokemonDataResponseMoves.fromJson(v));
      }
    }
    name = json['name']?.toString();
    order = int.tryParse(json['order']?.toString() ?? '');
    if (json['past_abilities'] != null) {
      pastAbilities = <PokemonDataResponsePastAbilities?>[];
      for (final v in json['past_abilities']) {
        pastAbilities?.add(PokemonDataResponsePastAbilities.fromJson(v));
      }
    }

    species = json['species'] != null
        ? PokemonDataResponseSpecies.fromJson(json['species'])
        : null;
    sprites = json['sprites'] != null
        ? PokemonDataResponseSprites.fromJson(json['sprites'])
        : null;
    if (json['stats'] != null) {
      stats = <PokemonDataResponseStats?>[];
      for (final v in json['stats']) {
        stats?.add(PokemonDataResponseStats.fromJson(v));
      }
    }
    if (json['types'] != null) {
      types = <PokemonDataResponseTypes?>[];
      for (final v in json['types']) {
        types?.add(PokemonDataResponseTypes.fromJson(v));
      }
    }
    weight = int.tryParse(json['weight']?.toString() ?? '');
  }
  PokemonDataEntity toEntity({
    String? species,
    List<PokemonEvolutionEntity?>? evolves,
  }) => PokemonDataEntity(
    id: id?.toString(),
    name: name,
    img: sprites?.other?.officialArtwork?.frontDefault,
    height: height,
    weight: weight,
    abilities: abilities?.map((e) {
      if ((e?.ability?.name ?? '').contains('-')) {
        return (e?.ability?.name ?? '').split('-').map((e) => e.caps).join(' ');
      }
      return e?.ability?.name?.caps;
    }).toList(),
    species: species,
    evolves: evolves,
    moves: moves
        ?.map(
          (e) => PokemonDataEntityMoves(id: e?.move?.url, name: e?.move?.name),
        )
        .toList(),
    stats: stats
        ?.map(
          (e) =>
              PokemonDataEntityStats(point: e?.baseStat, name: e?.stat?.name),
        )
        .toList(),
    types: types
        ?.map(
          (e) => PokemonDataEntityTypes(id: e?.type?.url, name: e?.type?.name),
        )
        .toList(),
  );
}

class PokemonDataResponseAbilities {
  PokemonDataResponseAbilitiesAbility? ability;
  bool? isHidden;
  int? slot;

  PokemonDataResponseAbilities({this.ability, this.isHidden, this.slot});

  PokemonDataResponseAbilities.fromJson(Map<String, dynamic> json) {
    ability = json['ability'] != null
        ? PokemonDataResponseAbilitiesAbility.fromJson(json['ability'])
        : null;
    isHidden = json['is_hidden'];
    slot = int.tryParse(json['slot']?.toString() ?? '');
  }
}

class PokemonDataResponseAbilitiesAbility {
  String? name;
  String? url;

  PokemonDataResponseAbilitiesAbility({this.name, this.url});

  PokemonDataResponseAbilitiesAbility.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonDataResponseCries {
  String? latest;
  String? legacy;

  PokemonDataResponseCries({this.latest, this.legacy});

  PokemonDataResponseCries.fromJson(Map<String, dynamic> json) {
    latest = json['latest']?.toString();
    legacy = json['legacy']?.toString();
  }
}

class PokemonDataResponseForms {
  String? name;
  String? url;

  PokemonDataResponseForms({this.name, this.url});

  PokemonDataResponseForms.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonDataResponseGameIndices {
  int? gameIndex;
  PokemonDataResponseGameIndicesVersion? version;

  PokemonDataResponseGameIndices({this.gameIndex, this.version});

  PokemonDataResponseGameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = int.tryParse(json['game_index']?.toString() ?? '');
    version = json['version'] != null
        ? PokemonDataResponseGameIndicesVersion.fromJson(json['version'])
        : null;
  }
}

class PokemonDataResponseGameIndicesVersion {
  String? name;
  String? url;

  PokemonDataResponseGameIndicesVersion({this.name, this.url});

  PokemonDataResponseGameIndicesVersion.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonDataResponseMoves {
  PokemonDataResponseMovesMove? move;
  List<PokemonDataResponseMovesVersionGroupDetails?>? versionGroupDetails;

  PokemonDataResponseMoves({this.move, this.versionGroupDetails});

  PokemonDataResponseMoves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null
        ? PokemonDataResponseMovesMove.fromJson(json['move'])
        : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <PokemonDataResponseMovesVersionGroupDetails?>[];
      for (final v in json['version_group_details']) {
        versionGroupDetails?.add(
          PokemonDataResponseMovesVersionGroupDetails.fromJson(v),
        );
      }
    }
  }
}

class PokemonDataResponseMovesMove {
  String? name;
  String? url;

  PokemonDataResponseMovesMove({this.name, this.url});

  PokemonDataResponseMovesMove.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonDataResponseMovesVersionGroupDetails {
  int? levelLearnedAt;
  PokemonDataResponseMovesVersionGroupDetailsMoveLearnMethod? moveLearnMethod;
  int? order;
  PokemonDataResponseMovesVersionGroupDetailsVersionGroup? versionGroup;

  PokemonDataResponseMovesVersionGroupDetails({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.order,
    this.versionGroup,
  });

  PokemonDataResponseMovesVersionGroupDetails.fromJson(
    Map<String, dynamic> json,
  ) {
    levelLearnedAt = int.tryParse(json['level_learned_at']?.toString() ?? '');
    moveLearnMethod = json['move_learn_method'] != null
        ? PokemonDataResponseMovesVersionGroupDetailsMoveLearnMethod.fromJson(
            json['move_learn_method'],
          )
        : null;
    order = int.tryParse(json['order']?.toString() ?? '');
    versionGroup = json['version_group'] != null
        ? PokemonDataResponseMovesVersionGroupDetailsVersionGroup.fromJson(
            json['version_group'],
          )
        : null;
  }
}

class PokemonDataResponseMovesVersionGroupDetailsMoveLearnMethod {
  String? name;
  String? url;

  PokemonDataResponseMovesVersionGroupDetailsMoveLearnMethod({
    this.name,
    this.url,
  });

  PokemonDataResponseMovesVersionGroupDetailsMoveLearnMethod.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonDataResponseMovesVersionGroupDetailsVersionGroup {
  String? name;
  String? url;

  PokemonDataResponseMovesVersionGroupDetailsVersionGroup({
    this.name,
    this.url,
  });

  PokemonDataResponseMovesVersionGroupDetailsVersionGroup.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonDataResponsePastAbilities {
  List<PokemonDataResponsePastAbilitiesAbilities?>? abilities;
  PokemonDataResponsePastAbilitiesGeneration? generation;

  PokemonDataResponsePastAbilities({this.abilities, this.generation});

  PokemonDataResponsePastAbilities.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <PokemonDataResponsePastAbilitiesAbilities?>[];
      for (final v in json['abilities']) {
        abilities?.add(PokemonDataResponsePastAbilitiesAbilities.fromJson(v));
      }
    }
    generation = json['generation'] != null
        ? PokemonDataResponsePastAbilitiesGeneration.fromJson(
            json['generation'],
          )
        : null;
  }
}

class PokemonDataResponsePastAbilitiesAbilities {
  String? ability;
  bool? isHidden;
  int? slot;

  PokemonDataResponsePastAbilitiesAbilities({
    this.ability,
    this.isHidden,
    this.slot,
  });

  PokemonDataResponsePastAbilitiesAbilities.fromJson(
    Map<String, dynamic> json,
  ) {
    ability = json['ability']?.toString();
    isHidden = json['is_hidden'];
    slot = int.tryParse(json['slot']?.toString() ?? '');
  }
}

class PokemonDataResponsePastAbilitiesGeneration {
  String? name;
  String? url;

  PokemonDataResponsePastAbilitiesGeneration({this.name, this.url});

  PokemonDataResponsePastAbilitiesGeneration.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonDataResponseSpecies {
  String? name;
  String? url;

  PokemonDataResponseSpecies({this.name, this.url});

  PokemonDataResponseSpecies.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonDataResponseSprites {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;
  PokemonDataResponseSpritesOther? other;
  PokemonDataResponseSpritesVersions? versions;

  PokemonDataResponseSprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
  });

  PokemonDataResponseSprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default']?.toString();
    backFemale = json['back_female']?.toString();
    backShiny = json['back_shiny']?.toString();
    backShinyFemale = json['back_shiny_female']?.toString();
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
    other = json['other'] != null
        ? PokemonDataResponseSpritesOther.fromJson(json['other'])
        : null;
    versions = json['versions'] != null
        ? PokemonDataResponseSpritesVersions.fromJson(json['versions'])
        : null;
  }
}

class PokemonDataResponseSpritesOther {
  PokemonDataResponseSpritesOtherDreamWorld? dreamWorld;
  PokemonDataResponseSpritesOtherHome? home;
  PokemonDataResponseSpritesOtherOfficialArtwork? officialArtwork;
  PokemonDataResponseSpritesOtherShowdown? showdown;

  PokemonDataResponseSpritesOther({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
    this.showdown,
  });

  PokemonDataResponseSpritesOther.fromJson(Map<String, dynamic> json) {
    dreamWorld = json['dream_world'] != null
        ? PokemonDataResponseSpritesOtherDreamWorld.fromJson(
            json['dream_world'],
          )
        : null;
    home = json['home'] != null
        ? PokemonDataResponseSpritesOtherHome.fromJson(json['home'])
        : null;
    officialArtwork = json['official-artwork'] != null
        ? PokemonDataResponseSpritesOtherOfficialArtwork.fromJson(
            json['official-artwork'],
          )
        : null;
    showdown = json['showdown'] != null
        ? PokemonDataResponseSpritesOtherShowdown.fromJson(json['showdown'])
        : null;
  }
}

class PokemonDataResponseSpritesOtherDreamWorld {
  String? frontDefault;
  String? frontFemale;

  PokemonDataResponseSpritesOtherDreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  PokemonDataResponseSpritesOtherDreamWorld.fromJson(
    Map<String, dynamic> json,
  ) {
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
  }
}

class PokemonDataResponseSpritesOtherHome {
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesOtherHome({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesOtherHome.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesOtherOfficialArtwork {
  String? frontDefault;
  String? frontShiny;

  PokemonDataResponseSpritesOtherOfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  PokemonDataResponseSpritesOtherOfficialArtwork.fromJson(
    Map<String, dynamic> json,
  ) {
    frontDefault = json['front_default']?.toString();
    frontShiny = json['front_shiny']?.toString();
  }
}

class PokemonDataResponseSpritesOtherShowdown {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesOtherShowdown({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesOtherShowdown.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default']?.toString();
    backFemale = json['back_female']?.toString();
    backShiny = json['back_shiny']?.toString();
    backShinyFemale = json['back_shiny_female']?.toString();
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersions {
  PokemonDataResponseSpritesVersionsGenerationI? generationI;
  PokemonDataResponseSpritesVersionsGenerationIi? generationIi;
  PokemonDataResponseSpritesVersionsGenerationIii? generationIii;
  PokemonDataResponseSpritesVersionsGenerationIv? generationIv;
  PokemonDataResponseSpritesVersionsGenerationV? generationV;
  PokemonDataResponseSpritesVersionsGenerationVi? generationVi;
  PokemonDataResponseSpritesVersionsGenerationVii? generationVii;
  PokemonDataResponseSpritesVersionsGenerationViii? generationViii;

  PokemonDataResponseSpritesVersions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  PokemonDataResponseSpritesVersions.fromJson(Map<String, dynamic> json) {
    generationI = json['generation-i'] != null
        ? PokemonDataResponseSpritesVersionsGenerationI.fromJson(
            json['generation-i'],
          )
        : null;
    generationIi = json['generation-ii'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIi.fromJson(
            json['generation-ii'],
          )
        : null;
    generationIii = json['generation-iii'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIii.fromJson(
            json['generation-iii'],
          )
        : null;
    generationIv = json['generation-iv'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIv.fromJson(
            json['generation-iv'],
          )
        : null;
    generationV = json['generation-v'] != null
        ? PokemonDataResponseSpritesVersionsGenerationV.fromJson(
            json['generation-v'],
          )
        : null;
    generationVi = json['generation-vi'] != null
        ? PokemonDataResponseSpritesVersionsGenerationVi.fromJson(
            json['generation-vi'],
          )
        : null;
    generationVii = json['generation-vii'] != null
        ? PokemonDataResponseSpritesVersionsGenerationVii.fromJson(
            json['generation-vii'],
          )
        : null;
    generationViii = json['generation-viii'] != null
        ? PokemonDataResponseSpritesVersionsGenerationViii.fromJson(
            json['generation-viii'],
          )
        : null;
  }
}

class PokemonDataResponseSpritesVersionsGenerationI {
  PokemonDataResponseSpritesVersionsGenerationIRedBlue? redBlue;
  PokemonDataResponseSpritesVersionsGenerationIYellow? yellow;

  PokemonDataResponseSpritesVersionsGenerationI({this.redBlue, this.yellow});

  PokemonDataResponseSpritesVersionsGenerationI.fromJson(
    Map<String, dynamic> json,
  ) {
    redBlue = json['red-blue'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIRedBlue.fromJson(
            json['red-blue'],
          )
        : null;
    yellow = json['yellow'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIYellow.fromJson(
            json['yellow'],
          )
        : null;
  }
}

class PokemonDataResponseSpritesVersionsGenerationIRedBlue {
  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  PokemonDataResponseSpritesVersionsGenerationIRedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  PokemonDataResponseSpritesVersionsGenerationIRedBlue.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backGray = json['back_gray']?.toString();
    backTransparent = json['back_transparent']?.toString();
    frontDefault = json['front_default']?.toString();
    frontGray = json['front_gray']?.toString();
    frontTransparent = json['front_transparent']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIYellow {
  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  PokemonDataResponseSpritesVersionsGenerationIYellow({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  PokemonDataResponseSpritesVersionsGenerationIYellow.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backGray = json['back_gray']?.toString();
    backTransparent = json['back_transparent']?.toString();
    frontDefault = json['front_default']?.toString();
    frontGray = json['front_gray']?.toString();
    frontTransparent = json['front_transparent']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIi {
  PokemonDataResponseSpritesVersionsGenerationIiCrystal? crystal;
  PokemonDataResponseSpritesVersionsGenerationIiGold? gold;
  PokemonDataResponseSpritesVersionsGenerationIiSilver? silver;

  PokemonDataResponseSpritesVersionsGenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  PokemonDataResponseSpritesVersionsGenerationIi.fromJson(
    Map<String, dynamic> json,
  ) {
    crystal = json['crystal'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIiCrystal.fromJson(
            json['crystal'],
          )
        : null;
    gold = json['gold'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIiGold.fromJson(
            json['gold'],
          )
        : null;
    silver = json['silver'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIiSilver.fromJson(
            json['silver'],
          )
        : null;
  }
}

class PokemonDataResponseSpritesVersionsGenerationIiCrystal {
  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  PokemonDataResponseSpritesVersionsGenerationIiCrystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  PokemonDataResponseSpritesVersionsGenerationIiCrystal.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backShiny = json['back_shiny']?.toString();
    backShinyTransparent = json['back_shiny_transparent']?.toString();
    backTransparent = json['back_transparent']?.toString();
    frontDefault = json['front_default']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyTransparent = json['front_shiny_transparent']?.toString();
    frontTransparent = json['front_transparent']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIiGold {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  PokemonDataResponseSpritesVersionsGenerationIiGold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  PokemonDataResponseSpritesVersionsGenerationIiGold.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backShiny = json['back_shiny']?.toString();
    frontDefault = json['front_default']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontTransparent = json['front_transparent']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIiSilver {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  PokemonDataResponseSpritesVersionsGenerationIiSilver({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  PokemonDataResponseSpritesVersionsGenerationIiSilver.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backShiny = json['back_shiny']?.toString();
    frontDefault = json['front_default']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontTransparent = json['front_transparent']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIii {
  PokemonDataResponseSpritesVersionsGenerationIiiEmerald? emerald;
  PokemonDataResponseSpritesVersionsGenerationIiiFireredLeafgreen?
  fireredLeafgreen;
  PokemonDataResponseSpritesVersionsGenerationIiiRubySapphire? rubySapphire;

  PokemonDataResponseSpritesVersionsGenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  PokemonDataResponseSpritesVersionsGenerationIii.fromJson(
    Map<String, dynamic> json,
  ) {
    emerald = json['emerald'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIiiEmerald.fromJson(
            json['emerald'],
          )
        : null;
    fireredLeafgreen = json['firered-leafgreen'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIiiFireredLeafgreen.fromJson(
            json['firered-leafgreen'],
          )
        : null;
    rubySapphire = json['ruby-sapphire'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIiiRubySapphire.fromJson(
            json['ruby-sapphire'],
          )
        : null;
  }
}

class PokemonDataResponseSpritesVersionsGenerationIiiEmerald {
  String? frontDefault;
  String? frontShiny;

  PokemonDataResponseSpritesVersionsGenerationIiiEmerald({
    this.frontDefault,
    this.frontShiny,
  });

  PokemonDataResponseSpritesVersionsGenerationIiiEmerald.fromJson(
    Map<String, dynamic> json,
  ) {
    frontDefault = json['front_default']?.toString();
    frontShiny = json['front_shiny']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIiiFireredLeafgreen {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;

  PokemonDataResponseSpritesVersionsGenerationIiiFireredLeafgreen({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  PokemonDataResponseSpritesVersionsGenerationIiiFireredLeafgreen.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backShiny = json['back_shiny']?.toString();
    frontDefault = json['front_default']?.toString();
    frontShiny = json['front_shiny']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIiiRubySapphire {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;

  PokemonDataResponseSpritesVersionsGenerationIiiRubySapphire({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  PokemonDataResponseSpritesVersionsGenerationIiiRubySapphire.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backShiny = json['back_shiny']?.toString();
    frontDefault = json['front_default']?.toString();
    frontShiny = json['front_shiny']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIv {
  PokemonDataResponseSpritesVersionsGenerationIvDiamondPearl? diamondPearl;
  PokemonDataResponseSpritesVersionsGenerationIvHeartgoldSoulsilver?
  heartgoldSoulsilver;
  PokemonDataResponseSpritesVersionsGenerationIvPlatinum? platinum;

  PokemonDataResponseSpritesVersionsGenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  PokemonDataResponseSpritesVersionsGenerationIv.fromJson(
    Map<String, dynamic> json,
  ) {
    diamondPearl = json['diamond-pearl'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIvDiamondPearl.fromJson(
            json['diamond-pearl'],
          )
        : null;
    heartgoldSoulsilver = json['heartgold-soulsilver'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIvHeartgoldSoulsilver.fromJson(
            json['heartgold-soulsilver'],
          )
        : null;
    platinum = json['platinum'] != null
        ? PokemonDataResponseSpritesVersionsGenerationIvPlatinum.fromJson(
            json['platinum'],
          )
        : null;
  }
}

class PokemonDataResponseSpritesVersionsGenerationIvDiamondPearl {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesVersionsGenerationIvDiamondPearl({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationIvDiamondPearl.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backFemale = json['back_female']?.toString();
    backShiny = json['back_shiny']?.toString();
    backShinyFemale = json['back_shiny_female']?.toString();
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIvHeartgoldSoulsilver {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesVersionsGenerationIvHeartgoldSoulsilver({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationIvHeartgoldSoulsilver.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backFemale = json['back_female']?.toString();
    backShiny = json['back_shiny']?.toString();
    backShinyFemale = json['back_shiny_female']?.toString();
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationIvPlatinum {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesVersionsGenerationIvPlatinum({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationIvPlatinum.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backFemale = json['back_female']?.toString();
    backShiny = json['back_shiny']?.toString();
    backShinyFemale = json['back_shiny_female']?.toString();
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationV {
  PokemonDataResponseSpritesVersionsGenerationVBlackWhite? blackWhite;

  PokemonDataResponseSpritesVersionsGenerationV({this.blackWhite});

  PokemonDataResponseSpritesVersionsGenerationV.fromJson(
    Map<String, dynamic> json,
  ) {
    blackWhite = json['black-white'] != null
        ? PokemonDataResponseSpritesVersionsGenerationVBlackWhite.fromJson(
            json['black-white'],
          )
        : null;
  }
}

class PokemonDataResponseSpritesVersionsGenerationVBlackWhite {
  PokemonDataResponseSpritesVersionsGenerationVBlackWhiteAnimated? animated;
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesVersionsGenerationVBlackWhite({
    this.animated,
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationVBlackWhite.fromJson(
    Map<String, dynamic> json,
  ) {
    animated = json['animated'] != null
        ? PokemonDataResponseSpritesVersionsGenerationVBlackWhiteAnimated.fromJson(
            json['animated'],
          )
        : null;
    backDefault = json['back_default']?.toString();
    backFemale = json['back_female']?.toString();
    backShiny = json['back_shiny']?.toString();
    backShinyFemale = json['back_shiny_female']?.toString();
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationVBlackWhiteAnimated {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesVersionsGenerationVBlackWhiteAnimated({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationVBlackWhiteAnimated.fromJson(
    Map<String, dynamic> json,
  ) {
    backDefault = json['back_default']?.toString();
    backFemale = json['back_female']?.toString();
    backShiny = json['back_shiny']?.toString();
    backShinyFemale = json['back_shiny_female']?.toString();
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationVi {
  PokemonDataResponseSpritesVersionsGenerationViOmegarubyAlphasapphire?
  omegarubyAlphasapphire;
  PokemonDataResponseSpritesVersionsGenerationViXY? xY;

  PokemonDataResponseSpritesVersionsGenerationVi({
    this.omegarubyAlphasapphire,
    this.xY,
  });

  PokemonDataResponseSpritesVersionsGenerationVi.fromJson(
    Map<String, dynamic> json,
  ) {
    omegarubyAlphasapphire = json['omegaruby-alphasapphire'] != null
        ? PokemonDataResponseSpritesVersionsGenerationViOmegarubyAlphasapphire.fromJson(
            json['omegaruby-alphasapphire'],
          )
        : null;
    xY = json['x-y'] != null
        ? PokemonDataResponseSpritesVersionsGenerationViXY.fromJson(json['x-y'])
        : null;
  }
}

class PokemonDataResponseSpritesVersionsGenerationViOmegarubyAlphasapphire {
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesVersionsGenerationViOmegarubyAlphasapphire({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationViOmegarubyAlphasapphire.fromJson(
    Map<String, dynamic> json,
  ) {
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationViXY {
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesVersionsGenerationViXY({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationViXY.fromJson(
    Map<String, dynamic> json,
  ) {
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationVii {
  PokemonDataResponseSpritesVersionsGenerationViiIcons? icons;
  PokemonDataResponseSpritesVersionsGenerationViiUltraSunUltraMoon?
  ultraSunUltraMoon;

  PokemonDataResponseSpritesVersionsGenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  PokemonDataResponseSpritesVersionsGenerationVii.fromJson(
    Map<String, dynamic> json,
  ) {
    icons = json['icons'] != null
        ? PokemonDataResponseSpritesVersionsGenerationViiIcons.fromJson(
            json['icons'],
          )
        : null;
    ultraSunUltraMoon = json['ultra-sun-ultra-moon'] != null
        ? PokemonDataResponseSpritesVersionsGenerationViiUltraSunUltraMoon.fromJson(
            json['ultra-sun-ultra-moon'],
          )
        : null;
  }
}

class PokemonDataResponseSpritesVersionsGenerationViiIcons {
  String? frontDefault;
  String? frontFemale;

  PokemonDataResponseSpritesVersionsGenerationViiIcons({
    this.frontDefault,
    this.frontFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationViiIcons.fromJson(
    Map<String, dynamic> json,
  ) {
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationViiUltraSunUltraMoon {
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonDataResponseSpritesVersionsGenerationViiUltraSunUltraMoon({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationViiUltraSunUltraMoon.fromJson(
    Map<String, dynamic> json,
  ) {
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
    frontShiny = json['front_shiny']?.toString();
    frontShinyFemale = json['front_shiny_female']?.toString();
  }
}

class PokemonDataResponseSpritesVersionsGenerationViii {
  PokemonDataResponseSpritesVersionsGenerationViiiIcons? icons;

  PokemonDataResponseSpritesVersionsGenerationViii({this.icons});

  PokemonDataResponseSpritesVersionsGenerationViii.fromJson(
    Map<String, dynamic> json,
  ) {
    icons = json['icons'] != null
        ? PokemonDataResponseSpritesVersionsGenerationViiiIcons.fromJson(
            json['icons'],
          )
        : null;
  }
}

class PokemonDataResponseSpritesVersionsGenerationViiiIcons {
  String? frontDefault;
  String? frontFemale;

  PokemonDataResponseSpritesVersionsGenerationViiiIcons({
    this.frontDefault,
    this.frontFemale,
  });

  PokemonDataResponseSpritesVersionsGenerationViiiIcons.fromJson(
    Map<String, dynamic> json,
  ) {
    frontDefault = json['front_default']?.toString();
    frontFemale = json['front_female']?.toString();
  }
}

class PokemonDataResponseStats {
  int? baseStat;
  int? effort;
  PokemonDataResponseStatsStat? stat;

  PokemonDataResponseStats({this.baseStat, this.effort, this.stat});

  PokemonDataResponseStats.fromJson(Map<String, dynamic> json) {
    baseStat = int.tryParse(json['base_stat']?.toString() ?? '');
    effort = int.tryParse(json['effort']?.toString() ?? '');
    stat = json['stat'] != null
        ? PokemonDataResponseStatsStat.fromJson(json['stat'])
        : null;
  }
}

class PokemonDataResponseStatsStat {
  String? name;
  String? url;

  PokemonDataResponseStatsStat({this.name, this.url});

  PokemonDataResponseStatsStat.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}

class PokemonDataResponseTypes {
  int? slot;
  PokemonDataResponseTypesType? type;

  PokemonDataResponseTypes({this.slot, this.type});

  PokemonDataResponseTypes.fromJson(Map<String, dynamic> json) {
    slot = int.tryParse(json['slot']?.toString() ?? '');
    type = json['type'] != null
        ? PokemonDataResponseTypesType.fromJson(json['type'])
        : null;
  }
}

class PokemonDataResponseTypesType {
  String? name;
  String? url;

  PokemonDataResponseTypesType({this.name, this.url});

  PokemonDataResponseTypesType.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
}
