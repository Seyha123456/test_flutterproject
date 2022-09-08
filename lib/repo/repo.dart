import 'package:flutter_fvm/model/model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Pokemon>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productOrderModelFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
