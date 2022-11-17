import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fvm/bloc/favorite/favorite_bloc.dart';
import 'package:flutter_fvm/model/model.dart';
import '../bloc/filter_bloc/filter_pokemon_bloc.dart';
import 'filter_result.dart';

class FilterScreen extends StatefulWidget {
  final List<PokemonModel> pokemon;
  const FilterScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> select = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FiltersPokemon',
        ),
      ),
      body: BlocBuilder<FilterPokemonBloc, FilterPokemonState>(
        builder: (context, state) {
          if (state is PokemonFavouriteLoadingState) {
            return Padding(
              padding: EdgeInsets.all(
                8.0,
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is FilterPokemonLoaded) {
            return Wrap(spacing: 5, children: [
              for (int i = 0; i < state.pokemonList.length; i++)
                Chip(
                  label: InkWell(
                    onTap: () {
                      context.read<FilterPokemonBloc>().add(
                            FilterSelect(
                              filter: state.pokemonList[i],
                            ),
                          );
                    },
                    child: Text(
                      state.pokemonList[i].toString(),
                    ),
                  ),
                ),
              Row(
                children: [
                  TextButton(
                    onPressed: (() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FilterResult(),
                        ),
                      );
                    }),
                    child: Text(
                      'Submit',
                    ),
                  ),
                ],
              )
            ]);
            // } else if (state is FilterPokemontype) {
            //   state.filters;
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
