import 'package:get_it/get_it.dart';
import 'package:pokebag_flutter/core/config/api.dart';
import 'package:pokebag_flutter/core/config/env/env.dart';
import 'package:pokebag_flutter/feature/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:pokebag_flutter/feature/pokemon/data/source/pokemon_remote_source.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/usecase/pokemon_detail_usecase.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/usecase/pokemons_usecase.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/bloc/pokemon_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory<PokemonBloc>(
    () => PokemonBloc(sl<PokemonsUsecase>(), sl<PokemonDetailUsecase>()),
  );

  sl.registerLazySingleton<API>(() => API(baseURL));
  sl.registerLazySingleton<PokemonRemoteSource>(
    () => PokemonRemoteSourceImpl(sl<API>()),
  );
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(sl<PokemonRemoteSource>()),
  );
  sl.registerLazySingleton<PokemonsUsecase>(
    () => PokemonsUsecase(sl<PokemonRepository>()),
  );
  sl.registerLazySingleton<PokemonDetailUsecase>(
    () => PokemonDetailUsecase(sl<PokemonRepository>()),
  );
}
