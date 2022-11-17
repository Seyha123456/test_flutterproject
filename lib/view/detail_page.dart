import 'package:flutter/material.dart';
import 'package:flutter_fvm/model/model.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel pokemon;

  DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DetailPage',
        ),
      ),
      body: _bodyDetail(),
    );
  }

  Widget _bodyDetail() {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              widget.pokemon.imageurl.toString(),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.pokemon.xdescription}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Height:' + ' ' '${widget.pokemon.height}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Category:' + ' ' '${widget.pokemon.category}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'HP:' + ' ' '${widget.pokemon.hp}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Speed:' + ' ' '${widget.pokemon.speed}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Attack:' + ' ' '${widget.pokemon.attack}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Defense:' + ' ' '${widget.pokemon.defense}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Type:' + ' ' '${widget.pokemon.typeofpokemon}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
