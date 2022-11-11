import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fvm/view/product_list.dart';
import '../bloc/pokemon_bloc_bloc.dart';
import '../model/model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'favorite_screen.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Icon(Icons.search),
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
              if(state is Loading){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }else if (state is FectSuccess){
                 return Expanded(
                   child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: state.pokemonList.length + 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      if (index < state.pokemonList.length) {
                        return ProductTile(state.pokemonList, index);
                      
                      } else {
                        return SizedBox();
                      }
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                                 ),
                 );
              }else if(state is Error){
                return Center(child: Text(state.message));
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }

  
  
  Widget ProductTile(final List<PokemonModel>? product, index,) {
  bool  isFavorite = false;
  return GestureDetector(
    // onTap: () => Get.to(DetailPage(
    //   pokemon: product,
    //   data: index,
    // )),
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
                    product![index].imageurl.toString(),
                    fit: BoxFit.cover, 
                  ),
                ),
                Positioned( bottom: 15, right: 15, //give the values according to your requirement
                  child: GestureDetector(
                   onTap: () {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (context) {
                    //             return FavoriteScreen();
                    //         },
                    //     ),
                    // );
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                   },
                    child: isFavorite? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite,color: Colors.grey,),
                ),),
              ],
            ),
            SizedBox(height: 8),
            Text(
              product[index].name.toString(),
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800,),
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
                    product[index].id.toString(),
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
            Text('\$${product[index].typeofpokemon}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    ),
  );
}
}
