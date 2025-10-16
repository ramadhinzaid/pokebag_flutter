import 'package:flutter/material.dart' hide AnimatedSlide;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokebag_flutter/core/utils/extension_custom.dart';
import 'package:pokebag_flutter/core/utils/utils.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/widget/pokemon_detail_provider.dart';
import 'dart:math';
import 'package:pokebag_flutter/feature/pokemon/presentation/widget/animated_fade.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/widget/pokemon_type_widget.dart';

part '../widget/pokemon_detail_background_widget.dart';
part '../widget/pokemon_detail_overall.dart';
part '../widget/pokemon_detail_info.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage(this.id, {super.key});
  final String? id;

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _rotateController;

  @override
  void initState() {
    _slideController = AnimationController(
      value: 1,
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..reverse();

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PokemonDetailProvider(
      slideController: _slideController,
      rotateController: _rotateController,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            _BackgroundDecoration(widget.id),
            _PokemonInfoCard(widget.id),
            _PokemonOverallInfo(widget.id),
          ],
        ),
      ),
    );
  }
}
