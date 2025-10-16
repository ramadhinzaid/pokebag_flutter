part of '../page/pokemon_detail_page.dart';

class _PokemonOverallInfo extends StatefulWidget {
  const _PokemonOverallInfo(this.id);
  final String? id;

  @override
  _PokemonOverallInfoState createState() => _PokemonOverallInfoState();
}

class _PokemonOverallInfoState extends State<_PokemonOverallInfo> {
  late String pokemonId;

  double textDiffLeft = 0.0;
  double textDiffTop = 0.0;

  PokemonBloc get pokemonBloc => context.read<PokemonBloc>();
  AnimationController get slideController =>
      PokemonDetailProvider.of(context).slideController;
  AnimationController get rotateController =>
      PokemonDetailProvider.of(context).rotateController;

  Animation<double> get textFadeAnimation =>
      Tween(begin: 1.0, end: 0.0).animate(slideController);
  Animation<double> get sliderFadeAnimation =>
      Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: slideController,
          curve: const Interval(0.0, 0.5, curve: Curves.ease),
        ),
      );

  @override
  void initState() {
    pokemonId = widget.id ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeader(),
        const SizedBox(height: 25),
        _buildPokemonSlider(),
      ],
    );
  }

  Widget _buildHeader() {
    final pokemon = (pokemonBloc.state.pokemons ?? []).firstWhere(
      (e) => e?.id == pokemonId,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: slideController,
                builder: (_, __) {
                  final value = slideController.value;
                  return Transform.translate(
                    offset: Offset(textDiffLeft * value, textDiffTop * value),
                    child: Text(
                      pokemon?.name?.caps ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 36 - (36 - 22) * value,
                      ),
                    ),
                  );
                },
              ),
              AnimatedFade(
                animation: textFadeAnimation,
                child: Text(
                  '#${pokemon?.id.toString().padLeft(3, '0')}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        AnimatedFade(
          animation: textFadeAnimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (pokemon?.types ?? [])
                  .take(3)
                  .map((type) => PokemonTypeWidget(name: type?.name))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPokemonSlider() {
    final height = MediaQuery.sizeOf(context).height;
    final pokemon = (pokemonBloc.state.pokemons ?? []).firstWhere(
      (e) => e?.id == pokemonId,
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: RotationTransition(
            turns: rotateController,
            child: Icon(
              Icons.catching_pokemon,
              size: height * 0.24,
              color: Colors.white24,
            ),
          ),
        ),
        Hero(
          tag: pokemon?.id ?? '',
          child: Image.network(
            pokemon?.img ?? '',
            width: height * 0.3,
            height: height * 0.3,
            // padding: EdgeInsets.symmetric(
            //   vertical: selected ? 0 : screenSize.height * 0.04,
            // ),
            // tintColor: selected ? null : Colors.black26,
            // useHero: selected,
          ),
        ),
      ],
    );
  }
}
