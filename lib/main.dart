import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fvm/bloc/pokemon_bloc_bloc.dart';
import 'package:flutter_fvm/view/homepage.dart';
import 'bloc/favorite/favorite_bloc.dart';
import 'bloc/filter_bloc/filter_pokemon_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final hasNext = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonFavouriteBloc(),
        ),
        BlocProvider(
          create: (context) => FilterPokemonBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider<PokemonBlocBloc>(
          create: (context) => PokemonBlocBloc()..add(GetEventData()),
          child: HomePage(),
        ),
      ),
    );
  }
}
