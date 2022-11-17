import 'package:bloc/bloc.dart';
import 'package:flutter_fvm/model/model.dart';
import 'package:flutter_fvm/repository/repo.dart';
import 'package:meta/meta.dart';
part 'pokemon_bloc_event.dart';
part 'pokemon_bloc_state.dart';

class PokemonBlocBloc extends Bloc<PokemonBlocEvent, PokemonBlocState> {
  PokemonBlocBloc() : super(PokemonBlocInitial()) {
    on<PokemonBlocEvent>(_onFetchPoke);
  }
  void _onFetchPoke(event, emit) async {
    try {
      emit(Loading());
      final List<PokemonModel> pokemonList =
          await ApiService.fetchPokemonList();
      final List<String> modelType = [];
      for (var poekmonItem in pokemonList) {
        poekmonItem.typeofpokemon.forEach((typeOfPoekmon) {
          if (!modelType.contains(typeOfPoekmon)) {
            modelType.add(typeOfPoekmon);
          }
        });
      }
      emit(FectSuccess(pokemonList, modelType));
    } catch (e) {
      emit(PokemonError(errorMsg: e.toString(), message: ''));
    }
  }
}
