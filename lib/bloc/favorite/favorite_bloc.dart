import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/model.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class PokemonFavouriteBloc extends Bloc<PokemonFavourite, FavoriteState> {
  final List<PokemonModel> _favouritePokemonList = [];
  PokemonFavouriteBloc() : super(PokemonFavouriteLoadingState()) {
    on<GetFavouriteList>((event, emit) async {
      try {
        emit(PokemonFavouriteLoadingState());

        emit(PokemonFavouriteSucessState(pokemonList: _favouritePokemonList));
      } catch (e) {
        emit(PokemonFavouriteErrorState(messageError: e.toString()));
      }
    });
    on<FavouriteClicked>((event, emit) async {
      try {
        emit(PokemonFavouriteLoadingState());
        if (_favouritePokemonList.contains(event.pokemonModel)) {
          _favouritePokemonList.remove(event.pokemonModel);
        } else {
          _favouritePokemonList.add(event.pokemonModel);
        }
        emit(PokemonFavouriteSucessState(pokemonList: _favouritePokemonList));
      } catch (e) {
        emit(PokemonFavouriteErrorState(messageError: e.toString()));
      }
    });
  }
}
