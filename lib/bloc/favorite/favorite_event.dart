part of 'favorite_bloc.dart';

abstract class PokemonFavourite {}

class FavouriteClicked extends PokemonFavourite {
  final PokemonModel pokemonModel;
  FavouriteClicked({required this.pokemonModel});
}

class GetFavouriteList extends PokemonFavourite {}
