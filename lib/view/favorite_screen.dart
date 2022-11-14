import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fvm/view/product_list.dart';

import '../bloc/favorite/favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    context.read<PokemonFavouriteBloc>().add(GetFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonFavouriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is PokemonFavouriteErrorState) {
          return Scaffold(
            body: Center(
              child: Text(state.messageError),
            ),
          );
        } else if (state is PokemonFavouriteSucessState) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Wishlist"),
                  ],
                ),
              ),
              body: ListView.builder(
                itemCount: state.pokemonList.length,
                itemBuilder: (context, index) {
                  return PokemonList(
                    pokemonModel: state.pokemonList[index],
                  );
                },
              ));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
