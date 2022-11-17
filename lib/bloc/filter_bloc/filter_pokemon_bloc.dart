import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/model.dart';
part 'filter_pokemon_event.dart';
part 'filter_pokemon_state.dart';

class FilterPokemonBloc extends Bloc<FilterPokemonEvent, FilterPokemonState> {
  FilterPokemonBloc() : super(FilterPokemonLoading()) {
    List<String> filters = [];
    on<FilterPokemonClicked>((event, emit) {
      // var allPokimonlist = [];
      // var selectedPokenmon = [];
      // var filteredPokenlist = [];
      // allPokimonlist.toSet().toList();
      // for (var pokenon in selectedPokenmon) {
      //   filteredPokenlist.addAll(
      //     allPokimonlist.where((element) => element.tpee),
      //   );
      // }
      if (state is FilterPokemonLoading) {
        try {
          var list = event.pokemonModel;
          List<PokemonModel> pokemonList = [];
          List<String> pokemonOption = [];
          pokemonList.toSet().toList();
          event.pokemonModel.forEach(
            (element) {
              pokemonOption.addAll(element.typeofpokemon);
            },
          );
          pokemonOption.toSet().toList().length;
          emit(
            FilterPokemonLoaded(
              pokemonList: pokemonOption.toSet().toList(),
              pokemonTypeList: pokemonList,
            ),
          );
        } catch (e) {
          emit(FilterPokemonError(messageError: e.toString()));
        }
      }
    });
    on<FilterSelect>((event, emit) {
      final filter = event.filter;
      filters.add(filter);
      List<PokemonModel> pokemonType = [];
      emit(FilterPokemontype(filters: filters, pokemon: pokemonType));
    });
  }
}
