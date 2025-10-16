import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokebag_flutter/core/utils/extension_custom.dart';
import 'package:pokebag_flutter/core/utils/utils.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/bloc/pokemon_event.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/bloc/pokemon_state.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/widget/pokemon_type_widget.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  late ScrollController scr;
  @override
  void initState() {
    scr = ScrollController();
    scr.addListener(() {
      final bloc = context.read<PokemonBloc>();
      if (scr.offset >= scr.position.maxScrollExtent &&
          !scr.position.outOfRange &&
          (bloc.state.next ?? '').isNotEmpty &&
          bloc.state.next != bloc.state.current) {
        bloc.add(PokemonList(bloc.state.next));
      }
    });
    context.read<PokemonBloc>().add(PokemonList('0'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokebag Flutter')),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (c, state) {
          if (state.pokemons == null) {
            return Center(child: CircularProgressIndicator());
          } else if ((state.pokemons ?? []).isEmpty) {
            return Center(child: Text('empty data'));
          } else {
            final width = MediaQuery.of(context).size.width;
            double imgWidth = 80;
            final length = state.pokemons?.length ?? 0;
            return GridView.builder(
              controller: scr,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width < 710
                    ? 2
                    : width < 1020
                    ? 3
                    : 4,
                childAspectRatio: 1.4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: state.loadMore ? length + 1 : length,
              itemBuilder: (cx, id) {
                if (id == length) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [CircularProgressIndicator(), Text('memuat')],
                    ),
                  );
                }
                final pokemon = state.pokemons?[id];
                final bgColor = getTypeColor(pokemon?.types?.first?.name ?? '');

                return GestureDetector(
                  onTap: () {
                    context.go('/${pokemon?.id}');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: bgColor.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -20,
                          bottom: -20,
                          child: Icon(
                            Icons.catching_pokemon,
                            size: 100,
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Hero(
                            tag: pokemon?.id ?? '$id',
                            child: Image.network(
                              pokemon?.img ?? '',
                              width: imgWidth,
                              height: imgWidth,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.catching_pokemon,
                                  size: imgWidth,
                                  color: Colors.white,
                                );
                              },
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pokemon?.name?.caps ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 4,
                                    children: (pokemon?.types ?? [])
                                        .map(
                                          (e) =>
                                              PokemonTypeWidget(name: e?.name),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
