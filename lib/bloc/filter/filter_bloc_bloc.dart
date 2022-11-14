import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fvm/model/model.dart';

part 'filter_bloc_event.dart';
part 'filter_bloc_state.dart';

class FilterBlocBloc extends Bloc<FilterBlocEvent, FilterBlocState> {
  FilterBlocBloc() : super(FilterBlocInitial()) {
    on<FilterBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
