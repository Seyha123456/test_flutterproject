// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_fvm/model/model.dart';

// part 'filter_bloc_event.dart';
// part 'filter_bloc_state.dart';

// class FilterBlocBloc extends Bloc<FilterBlocEvent, FilterBlocState> {
//   FilterBlocBloc() : super(FilterLoading()) {
//     on<FilterBlocEvent>(
//       (event, emit) {
//         try {
//           emit(FilterBlocState());
//           List<PokemonModel> pokemonList = this
//               .pokemonList
//               .where((e) => e.name
//                   .toLowerCase()
//                   .contains(event.pokemonName.toLowerCase()))
//               .toList();
//           emit(FilterLoadSuccess(pokemonList: pokemonList));
//         } catch (e) {
//           emit(FilterLoadError(
//             messageerror: e.toString(),
//           ));
//         }
//       },
//     );
//   }
// }
