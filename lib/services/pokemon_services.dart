import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon2/app/app_api.dart';
import 'package:pokemon2/data/pokemon_data.dart';

class PokemonServices {
  Future<List<PokemonData>> fetchData() async {
    final response = await http.get(Uri.parse(AppApi.pokemon));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((e) => PokemonData.fromJson(e))
          .toList();
      // process the data here
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
