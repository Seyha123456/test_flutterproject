import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fvm/model/model.dart';

class DetailPage extends StatefulWidget {
  final List<Pokemon>? pokemon;
  int data;
  DetailPage({Key? key, required this.pokemon, required this.data})
      : super(key: key);

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
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            widget.pokemon![widget.data].imageurl!,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.pokemon![widget.data].xdescription!}',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Height:' + ' ' '${widget.pokemon![widget.data].height!}',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Category:' + ' ' '${widget.pokemon![widget.data].category!}',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'HP:' + ' ' '${widget.pokemon![widget.data].hp!}',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Speed:' + ' ' '${widget.pokemon![widget.data].speed!}',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Attack:' + ' ' '${widget.pokemon![widget.data].attack!}',
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Defense:' + ' ' '${widget.pokemon![widget.data].defense!}',
            ),
          ),
        ],
      ),
    );
  }
}
