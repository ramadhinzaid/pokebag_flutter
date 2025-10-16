import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokebag_flutter/core/config/injection_container.dart' as di;
import 'package:pokebag_flutter/core/config/route.dart';
import 'package:pokebag_flutter/feature/pokemon/presentation/bloc/pokemon_bloc.dart';

void main() {
  di.init();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => di.sl<PokemonBloc>())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokebag',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routerConfig: routeConfig,
    );
  }
}
