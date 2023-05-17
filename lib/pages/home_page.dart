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
                  imageUrl: item.newUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
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
