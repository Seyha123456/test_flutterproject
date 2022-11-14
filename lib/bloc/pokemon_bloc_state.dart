part of 'pokemon_bloc_bloc.dart';

@immutable
abstract class PokemonBlocState {}

class PokemonBlocInitial extends PokemonBlocState {}

class Loading extends PokemonBlocState {}

class FectSuccess extends PokemonBlocState {
  List<PokemonModel> pokemonList;
  FectSuccess({
    required this.pokemonList,
  });
}

class PokemonError extends PokemonBlocState {
  String message;
  PokemonError({required this.message, required String errorMsg});
}
