import 'package:flutter/material.dart';

Color getTypeColor(String type) {
  final colors = {
    'grass': const Color(0xFF7AC74C),
    'fire': const Color(0xFFEE8130),
    'water': const Color(0xFF6390F0),
    'bug': const Color(0xFFA6B91A),
    'normal': const Color(0xFFA8A77A),
    'poison': const Color(0xFFA33EA1),
    'electric': const Color(0xFFF7D02C),
    'ground': const Color(0xFFE2BF65),
    'fairy': const Color(0xFFD685AD),
    'fighting': const Color(0xFFC22E28),
    'psychic': const Color(0xFFF95587),
    'rock': const Color(0xFFB6A136),
    'ghost': const Color(0xFF735797),
    'ice': const Color(0xFF96D9D6),
    'dragon': const Color(0xFF6F35FC),
    'dark': const Color(0xFF705746),
    'steel': const Color(0xFFB7B7CE),
    'flying': const Color(0xFFA98FF3),
  };
  return colors[type.toLowerCase()] ?? Colors.grey;
}

String pokemonImgById(String id) =>
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
