import 'package:flutter/material.dart';

class PokemonDetailProvider extends InheritedWidget {
  final AnimationController slideController;
  final AnimationController rotateController;

  const PokemonDetailProvider({
    super.key,
    required this.slideController,
    required this.rotateController,
    required super.child,
  });

  static PokemonDetailProvider of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<PokemonDetailProvider>();

    return result!;
  }

  @override
  bool updateShouldNotify(covariant PokemonDetailProvider oldWidget) => false;
}
