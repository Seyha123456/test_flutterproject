part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class PokemonFavouriteLoadingState extends FavoriteState {}

class PokemonFavouriteSucessState extends FavoriteState {
  final List<PokemonModel> pokemonList;
  PokemonFavouriteSucessState({required this.pokemonList});
}

class PokemonFavouriteErrorState extends FavoriteState {
  final String messageError;

  PokemonFavouriteErrorState({required this.messageError});
}
