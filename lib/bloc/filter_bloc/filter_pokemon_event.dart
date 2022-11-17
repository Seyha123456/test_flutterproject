part of 'filter_pokemon_bloc.dart';

abstract class FilterPokemonEvent extends Equatable {
  const FilterPokemonEvent();

  @override
  List<Object> get props => [];
}

class FilterPokemonClicked extends FilterPokemonEvent {
  final List<PokemonModel> pokemonModel;
  List<String> pokemonType = [];
  FilterPokemonClicked({required this.pokemonModel, required this.pokemonType});
}

class FilterSelect extends FilterPokemonEvent {
  final String filter;
  FilterSelect({required this.filter});
}

class FilterSubmit extends FilterPokemonEvent {
  List<PokemonModel> pokemonSubmit;
  FilterSubmit({required this.pokemonSubmit});
}
