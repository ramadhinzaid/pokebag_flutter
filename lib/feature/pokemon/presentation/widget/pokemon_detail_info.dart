part of '../page/pokemon_detail_page.dart';

class _PokemonInfoCard extends StatefulWidget {
  const _PokemonInfoCard(this.id);
  final String? id;

  @override
  State<_PokemonInfoCard> createState() => _PokemonInfoCardState();
}

class _PokemonInfoCardState extends State<_PokemonInfoCard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemons = context.read<PokemonBloc>().state.pokemons ?? [];
    final pokemon = pokemons.firstWhere(
      (e) => e?.id == widget.id,
      orElse: () => null,
    );
    return DraggableScrollableSheet(
      builder: (c, sc) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: EdgeInsets.only(top: 16),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                dividerColor: Colors.grey[200],
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
                tabs: [
                  Tab(text: 'About'),
                  Tab(text: 'Base Stats'),
                  Tab(text: 'Evolution'),
                  Tab(text: 'Moves'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _baseLayout(
                      child: Column(
                        spacing: 16,
                        children: [
                          _aboutChild(
                            title: 'Species',
                            value: pokemon?.species.caps ?? '',
                          ),
                          _aboutChild(
                            title: 'Height',
                            value: ((pokemon?.height ?? 1) / 10)
                                .toString()
                                .addUnit(' cm'),
                          ),
                          _aboutChild(
                            title: 'Weight',
                            value: ((pokemon?.weight ?? 1) / 10)
                                .toString()
                                .addUnit(' kg'),
                          ),
                          _aboutChild(
                            title: 'Abilities',
                            value: pokemon?.abilities
                                ?.map((e) => e.caps)
                                .join(', '),
                          ),
                        ],
                      ),
                    ),
                    _baseLayout(
                      child: Column(
                        spacing: 16,
                        children: (pokemon?.stats ?? [])
                            .map(
                              (e) => Row(
                                spacing: 16,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${e?.formatName}',
                                      style: context.textStyle.bodyMedium
                                          ?.copyWith(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${e?.point}',
                                      style: context.textStyle.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: LinearProgressIndicator(
                                      value: (e?.point ?? 1) / 100,
                                      color: ((e?.point ?? 1) / 100) < 0.5
                                          ? Colors.red
                                          : Colors.green,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    _baseLayout(
                      child: Wrap(
                        runSpacing: 16,
                        spacing: 16,
                        children: (pokemon?.evolves ?? []).map((e) {
                          final id = pokemons.indexWhere((p) => p?.id == e?.id);
                          String img = pokemonImgById(e?.id ?? '');
                          if (id >= 0) {
                            img = pokemons[id]?.img ?? '';
                          }
                          final level = e?.level?.toString() ?? '';
                          return Column(
                            children: [
                              if (img.isNotEmpty)
                                Image.network(img, width: 80, height: 80),
                              Text(e?.name.caps ?? ''),
                              if (level.isNotEmpty) Text('Lev. $level'),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    _baseLayout(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        children: (pokemon?.moves ?? [])
                            .map((e) => Chip(label: Text(e?.formatName ?? '')))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _baseLayout({Widget? child}) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 26),
      child: child,
    );
  }

  Widget _aboutChild({String? title, String? value}) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: Text(
            title ?? '',
            style: context.textStyle.bodyMedium?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value ?? '',
            textAlign: TextAlign.start,
            style: context.textStyle.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
