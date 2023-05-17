class PokemonData {
  String name;
  String url;

  PokemonData({
    required this.name,
    required this.url,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return PokemonData(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  String get newUrl {
    return 'https://www.pokemon.com/static-assets/app/static3/img/og-default-image.jpeg';
  }
}
