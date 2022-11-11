import 'dart:convert';

import 'package:flutter_fvm/model/model.dart';
import 'package:http/http.dart' as http;

 class ApiService {
  static Future<List<PokemonModel>> fetchPokemonList() async {
    try {
      final response = await http.get(Uri.parse("https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json"));
      if (response.body.isNotEmpty) {
        return pokemonListModelFromJson(utf8.decode(response.bodyBytes));
      } else {
        throw Exception('Failed to load pokemon list');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
