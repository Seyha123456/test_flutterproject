part of 'filter_bloc_bloc.dart';

abstract class FilterBlocEvent extends Equatable {
  const FilterBlocEvent();

  @override
  List<Object> get props => [];
}

class FilterLoad extends FilterBlocEvent {}
