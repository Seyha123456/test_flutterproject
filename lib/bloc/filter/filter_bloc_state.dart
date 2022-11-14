part of 'filter_bloc_bloc.dart';

abstract class FilterBlocState extends Equatable {
  const FilterBlocState();

  @override
  List<Object> get props => [];
}

class FilterBlocLoading extends FilterBlocState {}

class FilterBlocLoaded extends FilterBlocState {
  final PokemonModel pokemonModel;
  FilterBlocLoaded(this.pokemonModel);
}
