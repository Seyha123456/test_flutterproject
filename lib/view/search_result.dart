import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fvm/view/product_list.dart';

import '../bloc/pokemon_search/pokemon_search_bloc.dart';
import '../bloc/pokemon_search/pokemon_search_state.dart';

class SearchList extends StatefulWidget {
  final PokemonSearchBloc pokemonSeachBloc;
  SearchList(
      {required this.pokemonSeachBloc,
      required PokemonSearchBloc pokemonSearchBloc});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: widget.pokemonSeachBloc,
        builder: (BuildContext context, state) {
          if (state is PokemonSearchLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is PokemonSearchSucessState) {
            if (state.pokemonList.isEmpty) {
              return const Center(
                child: Text("No data"),
              );
            }
            return ListView.builder(
              itemCount: state.pokemonList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: PokemonList(
                          pokemonModel: state.pokemonList[index],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (state is PokemonSearchErrorState) {
            return Center(
              child: Text(state.messageError),
            );
          }
          return Container();
        },
      ),
    );
  }
}
