import 'package:go_router/go_router.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/page/pokemon_detail_page.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/page/pokemon_page.dart';

final routeConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => PokemonPage(),
      routes: [
        GoRoute(
          path: '/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return PokemonDetailPage(id);
          },
        ),
      ],
    ),
  ],
);
