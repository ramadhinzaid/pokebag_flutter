import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/entity/pokemon_data_entity.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/usecase/pokemon_detail_usecase.dart';
import 'package:pokebag_flutter/feature/pokemon/domain/usecase/pokemons_usecase.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/bloc/pokemon_event.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/bloc/pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  // usecase
  final PokemonsUsecase _getListUsecase;
  final PokemonDetailUsecase _getDetailUsecase;

  PokemonBloc(this._getListUsecase, this._getDetailUsecase)
    : super(PokemonState()) {
    on<PokemonList>(getList);
  }

  Future<void> getList(PokemonList event, Emitter<PokemonState> emit) async {
    emit(state.copyWith(current: event.offset));
    if ((event.offset ?? '') != '0') {
      emit(state.copyWith(loadMore: true));
    }
    final result = await _getListUsecase.call(event.offset ?? '');
    await result.fold(
      (error) {
        emit(state.copyWith(error: error));
      },
      (resp) async {
        List<PokemonDataEntity?> items = [];
        if ((event.offset ?? '') == '0') {
          items = [];
        } else {
          items = state.pokemons ?? [];
        }
        final nextParams = resp.next?.queryParameters ?? {};
        String? next;
        if (nextParams.containsKey('offset')) {
          next = nextParams['offset']?.toString();
        }
        for (PokemonDataEntity data in (resp.dataDetail ?? [])) {
          final uriId = Uri.tryParse(data.id ?? '');
          final paths = (uriId?.pathSegments ?? []);
          final realId = paths[paths.length - 2];
          final getDetail = await _getDetailUsecase.call(realId);
          await getDetail.fold(
            (error) {
              emit(state.copyWith(error: error));
            },
            (detail) {
              items.add(detail);
            },
          );
        }
        emit(state.copyWith(pokemons: items, next: next));
      },
    );
  }
}
