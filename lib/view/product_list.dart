import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fvm/bloc/favorite/favorite_bloc.dart';
import 'package:flutter_fvm/model/model.dart';
import 'package:flutter_fvm/view/detail_page.dart';

class PokemonList extends StatefulWidget {
  late final PokemonModel pokemonModel;
  PokemonList({required this.pokemonModel});
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              pokemon: widget.pokemonModel,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      widget.pokemonModel.imageurl.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 5, //give the values according to your requirement
                    child: IconButton(
                      onPressed: () {
                        context.read<PokemonFavouriteBloc>().add(
                            FavouriteClicked(
                                pokemonModel: widget.pokemonModel));
                      },
                      icon: BlocBuilder<PokemonFavouriteBloc, FavoriteState>(
                          builder: (context, state) {
                        if (state is PokemonFavouriteSucessState &&
                            state.pokemonList.contains(widget.pokemonModel)) {
                          return const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          );
                        }
                        return const Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        );
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                widget.pokemonModel.name.toString(),
                maxLines: 2,
                style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w800,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.pokemonModel.id.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.pokemonModel.typeofpokemon.toString(),
                style: TextStyle(fontSize: 32, fontFamily: 'avenir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
