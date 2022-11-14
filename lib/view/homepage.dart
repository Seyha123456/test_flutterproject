import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fvm/view/product_list.dart';
import 'package:flutter_fvm/view/search.dart';
import 'package:flutter_fvm/view/search_result.dart';
import '../bloc/favorite/favorite_bloc.dart';
import '../bloc/pokemon_bloc_bloc.dart';
import '../bloc/pokemon_search/pokemon_search_bloc.dart';
import '../bloc/pokemon_search/pokemon_search_event.dart';
import '../model/model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'detail_page.dart';
import 'favorite_screen.dart';
import 'filterScreen.dart';

class HomePage extends StatefulWidget {
  late final PokemonModel pokemonModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBlocBloc, PokemonBlocState>(
        builder: (context, state) {
      if (state is PokemonError) {
        return Scaffold(
          body: Center(
            child: Text(state.message),
          ),
        );
      } else if (state is FectSuccess) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavoriteScreen()));
                },
                icon: const Icon(Icons.favorite),
              ),
              SizedBox(
                width: 5,
              ),
              BlocProvider(
                create: (c) =>
                    PokemonSearchBloc(pokemonList: state.pokemonList),
                child: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: _SearchDelegation(
                              pokemonSearchBloc:
                                  BlocProvider.of<PokemonSearchBloc>(context)));
                    },
                    icon: const Icon(Icons.search),
                  );
                }),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FilterScreen()));
                },
                icon: const Icon(Icons.filter_list_alt),
              ),
            ],
            title: Text(
              'Pokemon',
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              BlocBuilder<PokemonBlocBloc, PokemonBlocState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is FectSuccess) {
                    return Expanded(
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: state.pokemonList.length + 1,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          if (index < state.pokemonList.length) {
                            return PokemonList(
                              pokemonModel: state.pokemonList[index],
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      ),
                    );
                  } else if (state is PokemonError) {
                    return Center(child: Text(state.message));
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}

class _SearchDelegation extends SearchDelegate {
  final PokemonSearchBloc pokemonSearchBloc;
  _SearchDelegation({required this.pokemonSearchBloc});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    pokemonSearchBloc.add(SearchPokemonEvent(pokemonName: query));
    return SearchList(
      pokemonSearchBloc: pokemonSearchBloc,
      pokemonSeachBloc: pokemonSearchBloc,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    pokemonSearchBloc.add(SearchPokemonEvent(pokemonName: query));
    return SearchList(
      pokemonSearchBloc: pokemonSearchBloc,
      pokemonSeachBloc: pokemonSearchBloc,
    );
  }
}
