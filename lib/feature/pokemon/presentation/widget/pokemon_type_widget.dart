import 'package:flutter/material.dart';
import 'package:pokebag_flutter/core/utils/extension_custom.dart';

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: (Colors.white).withValues(alpha: 0.3),
      ),
      child: Text(
        name?.caps ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
