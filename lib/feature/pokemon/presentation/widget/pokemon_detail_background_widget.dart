part of './../page/pokemon_detail_page.dart';

class _BoxDecoration extends StatelessWidget {
  static const Size size = Size.square(144);

  const _BoxDecoration();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi * 5 / 12,
      alignment: Alignment.center,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: const Alignment(-0.2, -0.2),
            end: const Alignment(1.5, -0.3),
            colors: [
              Colors.white.withValues(alpha: 0.3),
              Colors.white.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgroundDecoration extends StatefulWidget {
  const _BackgroundDecoration(this.id);
  final String? id;

  @override
  State<_BackgroundDecoration> createState() => _BackgroundDecorationState();
}

class _BackgroundDecorationState extends State<_BackgroundDecoration> {
  Animation<double> get rotateController =>
      PokemonDetailProvider.of(context).rotateController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildBoxDecoration(),
        _buildAppBarPokeballDecoration(),
      ],
    );
  }

  Widget _buildBackground() {
    final pokemon = context.read<PokemonBloc>().state.pokemons?.firstWhere(
      (e) => e?.id == widget.id,
    );
    final bgColor = getTypeColor(pokemon?.types?.first?.name ?? '');
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      constraints: const BoxConstraints.expand(),
      color: bgColor,
    );
  }

  Widget _buildBoxDecoration() {
    return Positioned(
      top: -_BoxDecoration.size.height * 0.4,
      left: -_BoxDecoration.size.width * 0.4,
      child: const _BoxDecoration(),
    );
  }

  Widget _buildAppBarPokeballDecoration() {
    final screenSize = MediaQuery.sizeOf(context);
    final safeAreaTop = MediaQuery.paddingOf(context).top;

    final pokeSize = screenSize.width * 0.5;
    final appBarHeight = AppBar().preferredSize.height;
    final iconButtonPadding = 16;
    final iconSize = IconTheme.of(context).size ?? 0;

    final pokeballTopMargin = -(pokeSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin =
        -(pokeSize / 2 - iconButtonPadding - iconSize / 2);

    return Positioned(
      top: pokeballTopMargin,
      right: pokeballRightMargin,
      child: IgnorePointer(
        ignoring: true,
        child: RotationTransition(
          turns: rotateController,
          child: Icon(
            Icons.catching_pokemon,
            size: pokeSize,
            color: Colors.white24,
          ),
        ),
      ),
    );
  }
}
