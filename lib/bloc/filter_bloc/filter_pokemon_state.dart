part of 'filter_pokemon_bloc.dart';

abstract class FilterPokemonState extends Equatable {
  const FilterPokemonState();

  @override
  List<Object> get props => [];
}

class FilterPokemonLoading extends FilterPokemonState {}

class FilterPokemonLoaded extends FilterPokemonState {
  List<String> pokemonList;
  List<PokemonModel> pokemonTypeList;
  FilterPokemonLoaded(
      {required this.pokemonList, required this.pokemonTypeList});
}

class FilterPokemonError extends FilterPokemonState {
  final String messageError;
  FilterPokemonError({required this.messageError});
}

class FilterPokemontype extends FilterPokemonState {
  List<String> filters;
  List<PokemonModel> pokemon;
  FilterPokemontype({required this.filters, required this.pokemon});
}
