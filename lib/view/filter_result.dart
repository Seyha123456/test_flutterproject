import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fvm/bloc/filter_bloc/filter_pokemon_bloc.dart';
import 'package:flutter_fvm/view/product_list.dart';

class FilterResult extends StatefulWidget {
  State<FilterResult> createState() => _FilterResultState();
}

class _FilterResultState extends State<FilterResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter Search',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<FilterPokemonBloc, FilterPokemonState>(
        builder: (context, state) {
          if (state is FilterPokemonLoading) {
            return CircularProgressIndicator();
          } else if (state is FilterPokemonLoaded) {
            return ListView.builder(
              itemCount: state.pokemonTypeList.length,
              itemBuilder: (context, index) {
                return PokemonList(
                  pokemonModel: state.pokemonTypeList[index],
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
