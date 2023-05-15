import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon2/data/pokemon_data.dart';
import 'package:pokemon2/services/pokemon_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonData> pokemonList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: pokemonList.length,
        // Replace with the actual number of items you want to display
        itemBuilder: (BuildContext context, int index) {
          final item = pokemonList[index];
          return Container(
            color: Colors.blueGrey,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: item.url,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.name),
                    ))
              ],
            ),
          );
        },
      ),
    );
    ;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final pokemonServices = PokemonServices();
      final list = await pokemonServices.fetchData();
      setState(() {
        pokemonList = list;
      });
    });
  }
}
